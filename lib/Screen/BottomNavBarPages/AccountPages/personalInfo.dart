import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/appbar/non_logo_appbar_model.dart';
import '../../../constant/constant.dart';
import '../../../ext/text_form_field.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _birthdayDateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();

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
          _fullnameController.text = userDoc['fullanme'];
          _birthdayDateController.text = userDoc['birthday'];
          _genderController.text = userDoc['gender'];
          _adressController.text = userDoc['adress'];
        });
      }
    }
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _birthdayDateController.dispose();
    _genderController.dispose();
    _adressController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonLogoAppBarModel(getTitle: () => "Personal Info"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ExtPageTFF.UsualEnabledFalseTFF(
              _fullnameController,
              Constant.green500,
              "Name Surname",
              "Name Surname",
              Icons.person,
            ),
            const SizedBox(height: 10),
            ExtPageTFF.UsualEnabledFalseTFF(
              _birthdayDateController,
              Constant.green500,
              "Birthday",
              "Birthday",
              Icons.calendar_month,
            ),
            const SizedBox(height: 10),
            ExtPageTFF.WithImageEnabledFalseTFF(
              _genderController,
              Constant.green500,
              "Gender",
              "Gender",
              "assets/icons/gender.png",
            ),
            const SizedBox(height: 10),
            ExtPageTFF.UsualEnabledFalseTFF(
              _adressController,
              Constant.green500,
              "Adress",
              "Adress",
              Icons.maps_home_work,
            ),
          ],
        ),
      ),
    );
  }
}
