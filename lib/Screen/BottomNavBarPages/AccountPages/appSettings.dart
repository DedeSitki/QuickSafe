import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quicksafe_project/components/appbar/non_logo_appbar_model.dart';

void _openSettings() {
  const platform = MethodChannel('com.example.quicksafe_project/settings');
  platform.invokeMethod('openSideKeySettings');
}

Widget accountPages(String icon, String title) {
  return GestureDetector(
    onTap: () => _openSettings(),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(icon),
              const SizedBox(width: 15),
              Text(title)
            ],
          ),
          Image.asset("assets/icons/forward.png")
        ],
      ),
    ),
  );
}


Widget sideButtonSettingsGuide() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("To Access Side Button Settings:", style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 10),
      Text("1. Open your phone's Settings app."),
      Text("2. Find the 'Advanced features' or 'Side key' menu."),
      Text("3. Edit side key settings."),
    ],
  );
}

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonLogoAppBarModel(getTitle: () => "Application Settings",),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              accountPages("assets/icons/settings.png", "Settings"),
              const SizedBox(height: 20),
              sideButtonSettingsGuide(),
            ],
          ),
        ),
      ),
    );
  }
}
