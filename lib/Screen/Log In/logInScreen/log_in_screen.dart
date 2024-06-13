import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grock/grock.dart';
import 'package:quicksafe_project/MainScreen/main_scaffold.dart';
import '../../../constant/constant.dart';
import '../../../ext/button.dart';
import '../../../ext/text_form_field.dart';
import '../../../ext/text_style.dart';
import '../../../firebase/firebase_auth_implementation/firebase_auth_services.dart';
import '../../../firebase/global/common/toast.dart';
import '../SignIn/sign_up.dart';
import '../forgotPassword/forgot_password.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

Map<String, dynamic>? _userData;

class _LogInScreenState extends State<LogInScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _isSigning = false;

  /*void _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print("User logged in successfully");
    } catch (e) {
      print("Error during login: $e");
    }
  }*/
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 25, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                welcomeText(),
                SizedBox(
                  height: 25,
                ),
                logInText(),
                SizedBox(
                  height: 25,
                ),
                ExtPageTFF.UsualTFF(_emailController, Constant.green500,
                    "E-Mail", "E-Mail", Icons.email),
                SizedBox(
                  height: 15,
                ),
                ExtPageTFF.UsualTFF(_passwordController, Constant.green500,
                    "Şifre", "Şifre", Icons.password_outlined),
                SizedBox(
                  height: 15,
                ),
                forgotPassword(),
                SizedBox(
                  height: 15,
                ),
                ExtPageButton.ObjectButton(() => _signIn(), Constant.green500,
                    "Giriş Yapınız", _isSigning),
                SizedBox(
                  height: 15,
                ),
                orText(),
                SizedBox(
                  height: 15,
                ),
                OtherLogin(),
                SizedBox(
                  height: 50,
                ),
                signInText(),
                SizedBox(height: 230),
                //AnimatedTextHi()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text welcomeText() {
    return Text(
      "Hoş Geldiniz",
      style: ExtPageText.TxtStyle(FontWeight.w700, 23, Constant.black),
    );
  }

  Widget logInText() {
    return Text(
      "Giriş Yapınız",
      style: ExtPageText.TxtStyle(FontWeight.w700, 40, Constant.black),
    );
  }

  GestureDetector signInText() {
    return GestureDetector(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Bir üyeliğiniz yok mu? ",
          style: ExtPageText.TxtStyle(FontWeight.w400, 15, Constant.black),
        ),
        Text(
          "Kayıt olun",
          style: ExtPageText.TxtStyle(FontWeight.w700, 15, Constant.black),
        )
      ]),
      onTap: () {
        Grock.to(SignUpScreen());
      },
    );
  }

  GestureDetector forgotPassword() {
    return GestureDetector(
      child: Text(
        "Şifremi unuttum!",
        style: ExtPageText.TxtStyle(FontWeight.w500, 14, Constant.yellow600),
      ),
      onTap: () {
        Grock.to(ForgotPassword());
      },
    );
  }

  Row orText() {
    return Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 2,
          color: Constant.yellow200,
        )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15), child: Text("veya")),
        Expanded(
            child: Divider(
          thickness: 2,
          color: Constant.yellow200,
        )),
      ],
    );
  }

  Widget OtherLogin() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
        child: GestureDetector(
          onTap: () {
            _signInWithGoogle();
          },
          child: Container(
            height: 60,
            width: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Constant.grey300),
            child: Image.asset("assets/icons/google.png"),
          ),
        ),
      ),
    ]);
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });
    if (user != null) {
      showToastCorrect(message: "User is succesfully signIn");
      Grock.to(MainScaffold());
    } else {
      showToastFail(message: "Some error happened");
    }
  }
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);

        showToastCorrect(message: "Successfully signed in with Google");

        Grock.to(MainScaffold());
      }
    } catch (e) {
      showToastFail(message: "Some error occurred: $e");
    }
  }

