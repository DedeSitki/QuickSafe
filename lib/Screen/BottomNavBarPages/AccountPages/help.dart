import 'package:flutter/material.dart';

import '../../../components/appbar/non_logo_appbar_model.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonLogoAppBarModel(getTitle: () => "Help"),
      body: Center(
        child: Text("Help"),
      ),
    );
  }
}
