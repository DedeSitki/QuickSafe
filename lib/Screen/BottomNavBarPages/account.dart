import 'package:flutter/material.dart';
import 'package:quicksafe_project/constant/constant.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          accountTest("assets/icons/attendance.png","Hesap Bilgilerim"),
          SizedBox(height: 10),
          accountTest("assets/icons/profile.png","Kişisel Bilgiler"),
          SizedBox(height: 10),
          accountTest("assets/icons/hospital.png","Sağlık Bilgileri"),
          SizedBox(height: 10),
          accountTest("assets/icons/mailbox.png","İletişim Bilgileri"),
          SizedBox(height: 10),
          accountTest("assets/icons/helpdesk.png","Yardım"),
          SizedBox(height: 10),
          accountTest("assets/icons/info.png","Uygulama Hakkında"),
        ],
      )
    );
  }
}

Widget accountTest(String icon, String title) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Constant.grey300,
        borderRadius: BorderRadius.circular(4)
    ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Image.asset(icon),
                SizedBox(width: 15),
                Text(title)
              ],
            ),
          ),
          Image.asset("assets/icons/forward.png")
        ],
      ),

  );
}
