import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _openSettings();
          },
          child: Text('Open Side Key Settings'),
        ),
      ),
    );
  }

  void _openSettings() {
    const platform = MethodChannel('com.example.yourapp/settings');
    platform.invokeMethod('openSideKeySettings');
  }
}
