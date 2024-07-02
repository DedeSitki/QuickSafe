import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/appbar/non_logo_appbar_model.dart';
import '../../../constant/constant.dart';
import '../../../ext/text_form_field.dart';

class HealthyInfo extends StatefulWidget {
  const HealthyInfo({super.key});

  @override
  State<HealthyInfo> createState() => _HealthyInfoState();
}

class _HealthyInfoState extends State<HealthyInfo> {

  final TextEditingController _medicalHistoryController = TextEditingController();
  final TextEditingController _allergyController = TextEditingController();
  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _emergencyInformationController = TextEditingController();

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
          _medicalHistoryController.text = userDoc['medicalHistory'];
          _allergyController.text = userDoc['allergy'];
          _medicineController.text = userDoc['medicine'];
          _emergencyInformationController.text = userDoc['emergencyContactInfoNumber'];
        });
      }
    }
  }

  @override
  void dispose() {
    _medicalHistoryController.dispose();
    _allergyController.dispose();
    _medicineController.dispose();
    _emergencyInformationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonLogoAppBarModel(getTitle: () => "Healthy Info"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ExtPageTFF.UsualEnabledFalseTFF(
              _medicalHistoryController,
              Constant.appbarRed,
              "Medical History",
              "Medical History",
              Icons.medical_services,
            ),
            const SizedBox(height: 10),
            ExtPageTFF.UsualEnabledFalseTFF(
              _allergyController,
              Constant.appbarRed,
              "Allergy",
              "Allergy",
              Icons.masks,
            ),
            const SizedBox(height: 10),
            ExtPageTFF.WithImageEnabledFalseTFF(
              _medicineController,
              Constant.appbarRed,
              "Medicine",
              "Medicine",
              "assets/icons/medicine.png",
            ),
            const SizedBox(height: 10),
            ExtPageTFF.UsualEnabledFalseTFF(
              _emergencyInformationController,
              Constant.appbarRed,
              "Emergency Information",
              "Emergency Information",
              Icons.medical_information,
            ),
          ],
        ),
      ),
    );
  }
}
