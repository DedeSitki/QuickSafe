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
            padding: EdgeInsets.only(top: 10, left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backIcons(),
                SizedBox(
                  height: 190,
                ),
                title(),
                SizedBox(
                  height: 30,
                ),
                explanationText(),
                SizedBox(
                  height: 30,
                ),
                ExtPageTFF.UsualTFF(
                    _password2controller,
                    Constant.green500,
                    "Şifrenizi Giriniz",
                    "Şifrenizi Giriniz",
                    Icons.password_outlined),
                SizedBox(
                  height: 20,
                ),
                ExtPageTFF.UsualTFF(
                    _password2checkcontroller,
                    Constant.green500,
                    "Şifrenizi Tekrar Giriniz",
                    "Şifrenizi Tekrar Giriniz",
                    Icons.password_outlined),
                SizedBox(
                  height: 20,
                ),
                ExtPageButton.PrimaryButton(
                    btnfunc, Constant.green500, "Gönder")
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
      "Şifreni Yenile",
      style: ExtPageText.TxtStyle(FontWeight.w700, 31, Constant.black),
      textAlign: TextAlign.center,
    );
  }

  Widget explanationText() {
    return Text(
      "Şifreni değiştirmek için yeni bir şifre gir.",
      style: ExtPageText.TxtStyle(FontWeight.w400, 14, Constant.black),
    );
  }

  btnfunc() {
    Grock.to(LogInScreen());
  }
}
