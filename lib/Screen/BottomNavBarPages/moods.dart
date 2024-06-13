import 'package:flutter/material.dart';

class Moods extends StatefulWidget {
  const Moods({super.key});

  @override
  State<Moods> createState() => _MoodsState();
}

class _MoodsState extends State<Moods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("moods"),
      ),
    );
  }
}
