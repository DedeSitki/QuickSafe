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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();

  bool value = false;
  bool _isSigningUp = false;

  @override
  void dispose() {
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
                height: 90,
              ),
              //E-Mail TFF
              ExtPageTFF.UsualTFF(_emailController, Constant.appbarRed,
                  "E-Mail Adress", "E-Mail Adress", Icons.email_outlined),
              const SizedBox(
                height: 15,
              ),
              //Password TFF
              ExtPageTFF.UsualTFF(
                  _passwordController,
                  Constant.appbarRed,
                  "Enter your password",
                  "Enter your password",
                  Icons.password_outlined),
              const SizedBox(
                height: 15,
              ),
              //Password Check TFF
              ExtPageTFF.UsualTFF(
                  _passwordCheckController,
                  Constant.appbarRed,
                  "Re-enter your password",
                  "Re-enter your password",
                  Icons.password_outlined),
              const SizedBox(
                height: 15,
              ),
              KVKK(),
              const SizedBox(
                height: 15,
              ),
              ExtPageButton.ObjectButton(
                  _signUp, Constant.appbarRed, "Sign Up", _isSigningUp),
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

    String email = _emailController.text;
    String password = _passwordController.text;
    String passwordCheck = _passwordCheckController.text;

    if (password != passwordCheck) {
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
      'email': email,
      'createdAt': FieldValue.serverTimestamp().toString(),
      'password': password,
    }, SetOptions(merge: true));
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
      "Sign Up",
      style: ExtPageText.TxtStyle(FontWeight.w700, 40, Constant.black),
    );
  }

  Row KVKK() {
    return Row(
      children: [
        Checkbox(
          activeColor: Constant.appbarRed,
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
                TextSpan(
                    text: 'I have read and accept the QuickSafe ',
                    style: TextStyle(color: Constant.black)),
                TextSpan(
                    text: 'Personal Data Protection ',
                    style: TextStyle(
                        color: Constant.appbarRed, fontWeight: FontWeight.w900)),
                TextSpan(
                    text: 'and Processing terms.'),
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
              const TextSpan(text: "Do you have a membership?"),
              TextSpan(
                  text: " Log In",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w600, 19, Constant.appbarRed))
            ])),
      ),
    );
  }
}
