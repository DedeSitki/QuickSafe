import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grock/grock.dart';
//import 'package:heo_final_project/firebase/firebase_auth_implementation/firebase_auth_services.dart';
import '../../../constant/constant.dart';
import '../../../ext/button.dart';
import '../../../ext/text_form_field.dart';
import '../../../ext/text_style.dart';
import '../../../firebase/global/common/toast.dart';
import '../logInScreen/log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _cellphoneController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordCheckController = TextEditingController();

  bool value = false;
  bool _isSigningUp = false;

  @override
  void dispose() {
    _cellphoneController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordCheckController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 25, left: 24, right: 24),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //backbtn(),
              SizedBox(
                height: 40,
              ),
              //text1(),
              SizedBox(
                height: 30,
              ),
              ExtPageTFF.inputFormattersTFF(
                _cellphoneController,
                Constant.green500,
                "Cep Telefonu Numaranız",
                "Cep Telefonu Numaranız",
                Icons.phone,
              ),
              SizedBox(
                height: 15,
              ),
              ExtPageTFF.UsualTFF(_fullNameController, Constant.green500,
                  "Adınız Soyadınız", "Adınız Soyadınız", Icons.person),
              SizedBox(
                height: 15,
              ),
              ExtPageTFF.UsualTFF(_emailController, Constant.green500,
                  "E-Mail Adresi", "E-Mail Adresi", Icons.email_outlined),
              SizedBox(
                height: 15,
              ),
              ExtPageTFF.UsualTFF(
                  _passwordController,
                  Constant.green500,
                  "Şifrenizi Giriniz",
                  "Şifrenizi Giriniz",
                  Icons.password_outlined),
              SizedBox(
                height: 15,
              ),
              ExtPageTFF.UsualTFF(
                  _passwordCheckController,
                  Constant.green500,
                  "Şifrenizi Tekrar Giriniz",
                  "Şifrenizi Tekrar Giriniz",
                  Icons.password_outlined),
              SizedBox(
                height: 15,
              ),
              //KVKK(),
              SizedBox(
                height: 15,
              ),
              ExtPageButton.ObjectButton(
                  _signUp, Constant.green500, "Kayıt Ol", _isSigningUp),
              SizedBox(
                height: 50,
              ),
              //text2(),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      _isSigningUp = true;
    });
    String cellPhone = _cellphoneController.text;
    String fullName = _fullNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String passwordCheck = _passwordCheckController.text;

    // User? user = await _auth.signUpWithEmailAndPassword(email, password);


    setState(() {
      _isSigningUp = false;
    });

    /*if (user != null) {
      await user.sendEmailVerification();
      showToastCorrect(message: "Please check your e-mail inbox and verify your account.");
      Grock.to(LogInScreen());
    } else {
      showToastFail(message: "Some error happened");
    }
  }*/

    Widget backbtn() {
      return GrockContainer(
          height: 35,
          onTap: () {
            Grock.to(LogInScreen());
          },
          child: SvgPicture.asset("assets/icons/back.svg"));
    }

    Widget text1() {
      return Text(
        "Kayıt Olun",
        style: ExtPageText.TxtStyle(FontWeight.w700, 40, Constant.black),
      );
    }

    Row KVKK() {
      return Row(
        children: [
          Checkbox(
            activeColor: Constant.green500,
            value: value,
            onChanged: (newValue) {
              setState(() {
                value = newValue!;
              });
            },
          ),
          Expanded(
              child: GrockContainer(
                onTap: () {
                  //Grock.to(KVKKPage());
                },
                child: RichText(
                  maxLines: 2,
                  text: TextSpan(
                    style: ExtPageText.TxtStyle(
                        FontWeight.w400, 15, Constant.black),
                    children: [
                      TextSpan(text: 'HEO ',
                          style: TextStyle(color: Constant.black)),
                      TextSpan(
                          text: 'Kişisel Verilerin Korunması ',
                          style: TextStyle(
                              color: Constant.green500,
                              fontWeight: FontWeight.w900)),
                      TextSpan(
                          text: 've İşlenmesi şartlarını okudum ve kabul ediyorum.'),
                    ],
                  ),
                ),
              )),
        ],
      );
    }

    Center text2() {
      return Center(
        child: GrockContainer(
          onTap: () {
            Grock.to(LogInScreen());
          },
          child: RichText(
              text: TextSpan(
                  style:
                  ExtPageText.TxtStyle(FontWeight.w600, 19, Constant.black),
                  children: [
                    TextSpan(text: "Üyeliğiniz var mı? "),
                    TextSpan(
                        text: "Giriş Yap",
                        style: ExtPageText.TxtStyle(
                            FontWeight.w600, 19, Constant.green500))
                  ])),
        ),
      );
    }
  }
}
