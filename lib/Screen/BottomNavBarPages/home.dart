import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/constant.dart';

class Home extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 100),
                title(),
                const SizedBox(height: 20),
                infoText(),
                const SizedBox(height: 80),
                emergencyButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget emergencyButton() {
    return GestureDetector(
      onTap: () async {
        setState(() {});
        await _controller.forward();
        await Future.delayed(const Duration(milliseconds: 100));
        await _controller.reverse();
        await Future.delayed(const Duration(milliseconds: 100));
        _launchURL("tel:05078871701");
        setState(() {});
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 - _controller.value * 0.2,
            child: child,
          );
        },
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                spreadRadius: 7,
                blurRadius: 30,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Image.asset(
              "assets/images/sos-button.png",
              fit: BoxFit.cover,
            ),
        ),
      ),
    );
  }

  Widget title(){
    return const Text(
      "Emergency",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Constant.appbarRed,
      ),
    );
  }

  Widget infoText(){
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        "In case of an emergency, you can call for help by pressing the button below.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Constant.grey,
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
