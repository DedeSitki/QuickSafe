import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import '../../../constant/constant.dart';
import '../../../ext/button.dart';
import '../../../ext/text_form_field.dart';
import '../../../ext/text_style.dart';
import '../../MainScreen/main_scaffold.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _medicalHistoryController =
      TextEditingController();
  final TextEditingController _allergyController = TextEditingController();
  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _cellPhoneController = TextEditingController();
  final TextEditingController _emergencyContactInfoController =
      TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _birthdayController.dispose();
    _genderController.dispose();
    _adressController.dispose();
    _medicalHistoryController.dispose();
    _allergyController.dispose();
    _medicineController.dispose();
    _bloodTypeController.dispose();
    _cellPhoneController.dispose();
    _emergencyContactInfoController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backbtn(),
              const SizedBox(
                height: 40,
              ),
              text1(),
              const SizedBox(
                height: 30,
              ),
              //FullName TFF
              ExtPageTFF.UsualTFF(
                _fullNameController,
                Constant.appbarRed,
                "Name Surname",
                "Name Surname",
                Icons.person,
              ),
              const SizedBox(
                height: 15,
              ),
              //Gender TFF
              ExtPageTFF.WithImageTFF(_genderController, Constant.appbarRed,
                  "Gender", "Gender", "assets/icons/gender.png"),
              const SizedBox(
                height: 15,
              ),
              //Birthday TFF
              ExtPageTFF.UsualTFF(_birthdayController, Constant.appbarRed,
                  "Birthday", "Birthday", Icons.calendar_month),
              const SizedBox(
                height: 15,
              ),
              //Adress TFF
              ExtPageTFF.UsualTFF(_adressController, Constant.appbarRed,
                  "Adress", "Adress", Icons.maps_home_work),
              const SizedBox(
                height: 15,
              ),
              //Medical History TFF
              ExtPageTFF.UsualTFF(_medicalHistoryController, Constant.appbarRed,
                  "Medical History", "Medical History", Icons.medical_services),
              const SizedBox(
                height: 15,
              ),
              //Allergy TFF
              ExtPageTFF.UsualTFF(_allergyController, Constant.appbarRed,
                  "Allergy", "Allergy", Icons.masks),
              const SizedBox(
                height: 15,
              ),
              // Medicine TFF
              ExtPageTFF.WithImageTFF(_medicineController, Constant.appbarRed,
                  "Medicine", "Medicine", "assets/icons/medicine.png"),
              const SizedBox(
                height: 15,
              ),
              //Blood Type TFF
              ExtPageTFF.UsualTFF(_bloodTypeController, Constant.appbarRed,
                  "Blood Type", "Blood Type", Icons.bloodtype),
              const SizedBox(
                height: 15,
              ),
              //Cell Phone TFF
              ExtPageTFF.inputFormattersTFF(
                _cellPhoneController,
                Constant.appbarRed,
                "Phone Number",
                "Phone Number",
                Icons.phone,
              ),
              const SizedBox(
                height: 15,
              ),
              //Emergency Contact Person Phone Number TFF
              ExtPageTFF.UsualTFF(
                  _emergencyContactInfoController,
                  Constant.appbarRed,
                  "Emergency Contact Person Phone Number",
                  "Emergency Contact Person Phone Number",
                  Icons.contact_emergency),
              const SizedBox(
                height: 35,
              ),
              ExtPageButton.PrimaryButton(
                  _signUp, Constant.appbarRed, "Edit Information"),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    User? user = FirebaseAuth.instance.currentUser;

    String fullname = _fullNameController.text;
    String gender = _genderController.text;
    String birthday = _birthdayController.text;
    String adress = _adressController.text;
    String medicalHistory = _medicalHistoryController.text;
    String allergy = _allergyController.text;
    String medicine = _medicineController.text;
    String bloodType = _bloodTypeController.text;
    String cellPhone = _cellPhoneController.text;
    String emergencyContactInfoNumber = _emergencyContactInfoController.text;

    await FirebaseFirestore.instance.collection('users').doc(user?.uid).update({
      'fullanme': fullname,
      'gender': gender,
      'birthday': birthday,
      'adress': adress,
      'medicalHistory': medicalHistory,
      'allergy': allergy,
      'medicine': medicine,
      'bloodType': bloodType,
      'cellPhone': cellPhone,
      'emergencyContactInfoNumber': emergencyContactInfoNumber,
    });

    Grock.to(MainScaffold());
  }
}

Widget backbtn() {
  return GrockContainer(
      height: 35,
      onTap: () {
        Grock.to(MainScaffold());
      },
      child: Image.asset("assets/icons/back.png"));
}

Widget text1() {
  return Text(
    "Edit Your Information",
    style: ExtPageText.TxtStyle(FontWeight.w700, 30, Constant.black),
  );
}
