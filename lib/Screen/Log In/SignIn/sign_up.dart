import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import '../../../constant/constant.dart';
import '../../../ext/button.dart';
import '../../../ext/text_form_field.dart';
import '../../../ext/text_style.dart';
import '../../../firebase/firebase_auth_implementation/firebase_auth_services.dart';
import '../../../firebase/global/common/toast.dart';
import '../KVKK/kvkkPage.dart';
import '../logInScreen/log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _cellphoneController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backbtn(),
              const SizedBox(
                height: 40,
              ),
              text1(),
              const SizedBox(
                height: 30,
              ),
              //CellPhone TFF
              ExtPageTFF.inputFormattersTFF(
                _cellphoneController,
                Constant.green500,
                "Cep Telefonu Numaranız",
                "Cep Telefonu Numaranız",
                Icons.phone,
              ),
              const SizedBox(
                height: 15,
              ),
              //FullName TFF
              ExtPageTFF.UsualTFF(_fullNameController, Constant.green500,
                  "Adınız Soyadınız", "Adınız Soyadınız", Icons.person),
              const SizedBox(
                height: 15,
              ),
              //Gender TFF
              ExtPageTFF.WithImageTFF(_genderController, Constant.green500,
                  "Gender", "Gender","assets/icons/gender.png"),
              const SizedBox(
                height: 15,
              ),
              //E-Mail TFF
              ExtPageTFF.UsualTFF(_emailController, Constant.green500,
                  "E-Mail Adresi", "E-Mail Adresi", Icons.email_outlined),
              const SizedBox(
                height: 15,
              ),
              //Password TFF
              ExtPageTFF.UsualTFF(
                  _passwordController,
                  Constant.green500,
                  "Şifrenizi Giriniz",
                  "Şifrenizi Giriniz",
                  Icons.password_outlined),
              const SizedBox(
                height: 15,
              ),
              //Passwprd Check TFF
              ExtPageTFF.UsualTFF(
                  _passwordCheckController,
                  Constant.green500,
                  "Şifrenizi Tekrar Giriniz",
                  "Şifrenizi Tekrar Giriniz",
                  Icons.password_outlined),
              const SizedBox(
                height: 15,
              ),

              KVKK(),
              const SizedBox(
                height: 15,
              ),
              ExtPageButton.ObjectButton(
                  _signUp, Constant.green500, "Kayıt Ol", _isSigningUp),
              const SizedBox(
                height: 50,
              ),
              text2(),
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

    if(password != passwordCheck){
      showToastFail(message: "Password do not match");
      setState(() {
        _isSigningUp = false;
      });
      return;
    }

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      _isSigningUp = false;
    });

    if (user != null) {
      await user.sendEmailVerification();
      showToastCorrect(
          message: "Please check your e-mail inbox and verify your account.");
      Grock.to(const LogInScreen());
    } else {
      showToastFail(message: "Some error happened");
    }

    await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
      'cellPhone': cellPhone,
      'fullName': fullName,
      'email': email,
      'createdAt': FieldValue.serverTimestamp().toString(),
      'password': password,
    });
  }

  Widget backbtn() {
    return GrockContainer(
        height: 35,
        onTap: () {
          Grock.to(const LogInScreen());
        },
        child: Image.asset("assets/icons/back.png"));
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
            Grock.to(const KVKKPage());
          },
          child: RichText(
            maxLines: 2,
            text: TextSpan(
              style: ExtPageText.TxtStyle(FontWeight.w400, 15, Constant.black),
              children: const [
                TextSpan(text: 'QuickSafe ', style: TextStyle(color: Constant.black)),
                TextSpan(
                    text: 'Kişisel Verilerin Korunması ',
                    style: TextStyle(
                        color: Constant.green500, fontWeight: FontWeight.w900)),
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
          Grock.to(const LogInScreen());
        },
        child: RichText(
            text: TextSpan(
                style:
                    ExtPageText.TxtStyle(FontWeight.w600, 19, Constant.black),
                children: [
              const TextSpan(text: "Üyeliğiniz var mı? "),
              TextSpan(
                  text: "Giriş Yap",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w600, 19, Constant.green500))
            ])),
      ),
    );
  }
}
