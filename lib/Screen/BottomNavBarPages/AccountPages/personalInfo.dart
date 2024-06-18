import 'package:flutter/material.dart';

import '../../../components/appbar/non_logo_appbar_model.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonLogoAppBarModel(getTitle: () => "Personal Info"),
      body: Center(
        child: Text("PersonalInfo"),
      ),
    );
  }
}
