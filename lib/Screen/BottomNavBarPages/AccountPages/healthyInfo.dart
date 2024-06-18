import 'package:flutter/material.dart';

import '../../../components/appbar/non_logo_appbar_model.dart';

class HealthyInfo extends StatefulWidget {
  const HealthyInfo({super.key});

  @override
  State<HealthyInfo> createState() => _HealthyInfoState();
}

class _HealthyInfoState extends State<HealthyInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonLogoAppBarModel(getTitle: () => "Healthy Info"),
      body: Center(
        child: Text("HealthyInfo"),
      ),
    );
  }
}
