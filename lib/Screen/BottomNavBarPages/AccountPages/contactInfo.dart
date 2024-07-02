import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/appbar/non_logo_appbar_model.dart';
import '../../../constant/constant.dart';
import '../../../ext/text_form_field.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {

  final TextEditingController _cellphoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emergencyContactInfo = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        setState(() {
          _cellphoneController.text = userDoc['cellPhone'] ;
          _emailController.text = userDoc['email'];
          _emergencyContactInfo.text = userDoc['emergencyContactInfoNumber'];

        });
      }
    }
  }
  @override
  void dispose() {
    _cellphoneController.dispose();
    _emailController.dispose();
    _emergencyContactInfo.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonLogoAppBarModel(getTitle: () => "Contact Info"),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ExtPageTFF.UsualEnabledFalseTFF(
                _cellphoneController,
                Constant.appbarRed,
                "CellPhone",
                "CellPhone",
                Icons.phone_android,
              ),
              const SizedBox(height: 10),
              ExtPageTFF.UsualEnabledFalseTFF(
                _emailController,
                Constant.appbarRed,
                "Email",
                "Email",
                Icons.mail,
              ),
              const SizedBox(height: 10),
              ExtPageTFF.UsualEnabledFalseTFF(
                _emergencyContactInfo,
                Constant.appbarRed,
                "Emergency Contact Info",
                "Emergency Contact Info",
                Icons.contact_emergency,
              ),
            ],
          ),
        ),
    );
  }
}
