import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quicksafe_project/constant/constant.dart';
import 'package:quicksafe_project/ext/text_form_field.dart';
import '../../../components/appbar/non_logo_appbar_model.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _cellphoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _createdDateController = TextEditingController();

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
          _fullNameController.text = userDoc['fullName'];
          _cellphoneController.text = userDoc['cellPhone'];
          _emailController.text = userDoc['email'];
          _createdDateController.text = userDoc['createdAt'];
        });
      }
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonLogoAppBarModel(getTitle: () => "Account Info"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ExtPageTFF.UsualTFF(
              _fullNameController,
              Constant.green500,
              "Full Name",
              "Full Name",
              Icons.person,
            ),
            const SizedBox(height: 10),
            ExtPageTFF.UsualTFF(
              _cellphoneController,
              Constant.green500,
              "cellPhone",
              "cellPhone",
              Icons.phone_android,
            ),
            const SizedBox(height: 10),
            ExtPageTFF.UsualTFF(
              _emailController,
              Constant.green500,
              "e-Mail",
              "e-Mail",
              Icons.mail,
            ),
            const SizedBox(height: 10),
            ExtPageTFF.UsualTFF(
              _createdDateController,
              Constant.green500,
              "Created Date",
              "Created Date",
              Icons.calendar_month,
            ),
          ],
        ),
      ),
    );
  }
}
