import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 10),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            emergencyButton(),
          ],
        ),
      ),
    );
  }

  Widget emergencyButton() {
    return GestureDetector(
      onTap: () async {
        setState(() {
        });
        await _controller.forward();
        await Future.delayed(const Duration(milliseconds: 10));
        await _controller.reverse();
        await Future.delayed(const Duration(milliseconds: 10));
        _launchURL("tel:05078871701");
        setState(() {
        });
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
          child: Image.asset(
            "assets/images/sos-button.png",
            fit: BoxFit.cover,
          ),
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
