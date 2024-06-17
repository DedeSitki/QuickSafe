import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              emercencyButton(),
            ],
          ),
        ),
    );
  }

  Widget emercencyButton() {
    return GestureDetector(
      onTap: (){
        _launchURL("tel:05078871701");
      },
      child: Container(
        width: 150,
        height: 150,
        child: Image.asset(
          "assets/images/sos-button.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
