import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import '../../../../../../constant/constant.dart';
import '../../../ext/button.dart';
import '../../../ext/text_form_field.dart';
import '../../../ext/text_style.dart';
import '../logInScreen/log_in_screen.dart';

class ForgotPassword2 extends StatefulWidget {
  const ForgotPassword2({super.key});

  @override
  State<ForgotPassword2> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword2> {
  final TextEditingController _password2controller = TextEditingController();
  final TextEditingController _password2checkcontroller =
      TextEditingController();
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
                ExtPageTFF.UsualTFF(
                    _password2controller,
                    Constant.appbarRed,
                    "Enter your new password",
                    "Enter your new password",
                    Icons.password_outlined),
                const SizedBox(
                  height: 20,
                ),
                ExtPageTFF.UsualTFF(
                    _password2checkcontroller,
                    Constant.appbarRed,
                    "Enter your new password",
                    "Enter your new password",
                    Icons.password_outlined),
                const SizedBox(
                  height: 20,
                ),
                ExtPageButton.PrimaryButton(
                    btnfunc, Constant.appbarRed, "Send")
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
      textAlign: TextAlign.center,
    );
  }

  Widget explanationText() {
    return Text(
      "To change your password, enter a new password.",
      style: ExtPageText.TxtStyle(FontWeight.w400, 14, Constant.grey),
    );
  }

  btnfunc() {
    Grock.to(const LogInScreen());
  }
}
