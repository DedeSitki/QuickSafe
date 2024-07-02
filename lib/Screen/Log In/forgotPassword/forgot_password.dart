import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grock/grock.dart';
import '../../../../../../constant/constant.dart';
import '../../../ext/button.dart';
import '../../../ext/text_form_field.dart';
import '../../../ext/text_style.dart';
import 'fotgot_password2.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailcheckcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backIcons(),
                const SizedBox(
                  height: 190,
                ),
                title(),
                const SizedBox(
                  height: 30,
                ),
                explanationText(),
                const SizedBox(
                  height: 30,
                ),
                ExtPageTFF.UsualTFF(_emailcheckcontroller, Constant.appbarRed,
                    "E-Mail", "E-Mail", Icons.email_outlined),
                const SizedBox(
                  height: 20,
                ),
                ExtPageButton.PrimaryButton(
                    btnfuct, Constant.appbarRed, "Send")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget backIcons() {
    return GrockContainer(
      height: 35,
      child: SvgPicture.asset("assets/icons/back.svg"),
      onTap: () {
        Grock.back();
      },
    );
  }

  Text title() {
    return Text(
      "Reset Your Password",
      style: ExtPageText.TxtStyle(FontWeight.w700, 31, Constant.grey),
    );
  }

  Widget explanationText() {
    return Text(
      "Continue by entering your registered email address below.",
      style: ExtPageText.TxtStyle(FontWeight.w400, 14, Constant.grey),
    );
  }

  btnfuct() {
    Grock.to(const ForgotPassword2());
  }
}
