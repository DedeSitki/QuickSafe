import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:quicksafe_project/Screen/BottomNavBarPages/AccountPages/aboutApp.dart';
import 'package:quicksafe_project/Screen/BottomNavBarPages/AccountPages/contactInfo.dart';
import 'package:quicksafe_project/Screen/BottomNavBarPages/AccountPages/help.dart';
import 'package:quicksafe_project/Screen/BottomNavBarPages/AccountPages/personalInfo.dart';
import 'package:quicksafe_project/Screen/Log%20In/logInScreen/log_in_screen.dart';
import 'package:quicksafe_project/constant/constant.dart';
import 'package:quicksafe_project/ext/button.dart';
import '../../firebase/global/common/toast.dart';
import 'AccountPages/accountInfo.dart';
import 'AccountPages/healthyInfo.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 30),
        accountPages(
            "assets/icons/attendance.png", "Hesap Bilgilerim", AccountInfo()),
        SizedBox(height: 10),
        accountPages(
            "assets/icons/profile.png", "Kişisel Bilgiler", PersonalInfo()),
        SizedBox(height: 10),
        accountPages(
            "assets/icons/hospital.png", "Sağlık Bilgileri", HealthyInfo()),
        SizedBox(height: 10),
        accountPages(
            "assets/icons/mailbox.png", "İletişim Bilgileri", ContactInfo()),
        SizedBox(height: 10),
        accountPages("assets/icons/helpdesk.png", "Yardım", Help()),
        SizedBox(height: 10),
        accountPages("assets/icons/info.png", "Uygulama Hakkında", AboutApp()),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 140),
          child: ExtPageButton.PrimaryButton(() {
            _exitFunc(context);
          }, Constant.appbarRed, "Log Out"),
        )
      ],
    ));
  }
}

void _exitFunc(BuildContext context) async {
  try {
    await auth.signOut();
    showToastCorrect(message: "User is successfully logged out");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LogInScreen()),
      (route) => false,
    );
  } catch (e) {
    showToastFail(message: "Some error happened: $e");
  }
}

Widget accountPages(String icon, String title, Widget pageName) {
  return GestureDetector(
    onTap: () => Grock.to(pageName),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Constant.grey300, borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [Image.asset(icon), SizedBox(width: 15), Text(title)],
            ),
          ),
          Image.asset("assets/icons/forward.png")
        ],
      ),
    ),
  );
}
