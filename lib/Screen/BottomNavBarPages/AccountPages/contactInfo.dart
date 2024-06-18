import 'package:flutter/material.dart';

import '../../../components/appbar/non_logo_appbar_model.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonLogoAppBarModel(getTitle: () => "Contact Info"),
      body: Center(
        child: Text("ContactInfo"),
      ),
    );
  }
}
