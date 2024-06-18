import 'package:flutter/material.dart';
import 'package:quicksafe_project/components/appbar/non_logo_appbar_model.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonLogoAppBarModel(getTitle: () => "Account Info"),
      body: Center(
        child: Text("AccountInfo"),
      ),
    );
  }
}
