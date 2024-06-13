import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:quicksafe_project/ext/text_style.dart';
import '../constant/constant.dart';

class ExtPageButton {
  static PrimaryButton(VoidCallback onPressed, Color color, String text) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: color),
          child: Text(text,
              style:
                  ExtPageText.TxtStyle(FontWeight.w600, 16, Constant.white))),
    );
  }

  static ObjectButton(
      VoidCallback onPressed, Color color, String text, bool signingUp) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          backgroundColor: color,
        ),
        child: signingUp
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Constant.white),
              )
            : Text(
                text,
                style:
                    ExtPageText.TxtStyle(FontWeight.w600, 16, Constant.white),
              ),
      ),
    );
  }

  static leadingButton(VoidCallback onPressed, Color color, String text,IconData icon, VoidCallback iconFunc) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(text,
                style:
                ExtPageText.TxtStyle(FontWeight.w600, 16, Constant.white),),
              GrockContainer(
                onTap: iconFunc,
                  child: Icon(icon))
            ]
          ),
      ),
    );
  }
}
