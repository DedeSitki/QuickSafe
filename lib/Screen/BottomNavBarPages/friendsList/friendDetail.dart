import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import '../../../constant/constant.dart';
import '../../../ext/text_form_field.dart';
import '../../../ext/text_style.dart';
import '../../MainScreen/main_scaffold.dart';

class FriendDetail extends StatefulWidget {
  const FriendDetail({super.key});

  @override
  State<FriendDetail> createState() => _FriendDetailState();
}

class _FriendDetailState extends State<FriendDetail> {
  final TextEditingController _userIdController = TextEditingController();
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
    _userIdController.dispose();
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

  Future<void> _loadUserData(String userId) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();

    if (userDoc.exists) {
      setState(() {
        _fullNameController.text = userDoc['fullanme'] ?? '';
        _birthdayController.text = userDoc['birthday'] ?? '';
        _genderController.text = userDoc['gender'] ?? '';
        _adressController.text = userDoc['adress'] ?? '';
        _medicalHistoryController.text = userDoc['medicalHistory'] ?? '';
        _allergyController.text = userDoc['allergy'] ?? '';
        _medicineController.text = userDoc['medicine'] ?? '';
        _bloodTypeController.text = userDoc['bloodType'] ?? '';
        _cellPhoneController.text = userDoc['cellPhone'] ?? '';
        _emergencyContactInfoController.text = userDoc['emergencyContactInfoNumber'] ?? '';
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kullanıcı bulunamadı.')),
      );
    }
  }

  @override
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
              //User ID TFF
              ExtPageTFF.UsualTFF(
                _userIdController,
                Constant.appbarRed,
                "User ID",
                "Enter User ID",
                Icons.person_search,
              ),
              const SizedBox(height: 15),
              //Search Button
              ElevatedButton(
                onPressed: () {
                  _loadUserData(_userIdController.text);
                },
                child: const Text('Search User'),
              ),
              const SizedBox(height: 30),
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
            ],
          ),
        ),
      ),
    );
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
    "User Information",
    style: ExtPageText.TxtStyle(FontWeight.w700, 30, Constant.black),
  );
}
