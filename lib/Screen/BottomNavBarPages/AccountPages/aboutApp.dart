import 'package:flutter/material.dart';
import '../../../components/appbar/non_logo_appbar_model.dart';
import '../../../constant/constant.dart';
import '../../../ext/text_style.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.grey300,
      appBar: NonLogoAppBarModel(
        getTitle: () {
          return "About App";
        },
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                appLogo(),
                const SizedBox(height: 20,),
                appName(),
                const SizedBox(height: 5,),
                appVersion(),
                year()
              ],
            ),
      ),
    );
  }

  Widget appLogo() {
    return ClipOval(
        child: Image.asset(
          "assets/images/quick-safe-logo.png",
          width: 150,
        ));
  }

  Widget appName() {
    return Text("Quick Safe",style: ExtPageText.TxtStyle(FontWeight.w600, 21, Constant.black),);
  }

  Widget appVersion() {
    return Text("0.00.01 v",style: ExtPageText.TxtStyle(FontWeight.w400, 10, Constant.grey700),);
  }

  Widget year(){
    return Text("2024",style: ExtPageText.TxtStyle(FontWeight.w400, 8, Constant.grey700),);
  }
}

