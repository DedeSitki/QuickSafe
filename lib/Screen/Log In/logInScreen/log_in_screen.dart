import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grock/grock.dart';
import '../../../constant/constant.dart';
import '../../../ext/button.dart';
import '../../../ext/text_form_field.dart';
import '../../../ext/text_style.dart';
import '../../../firebase/firebase_auth_implementation/firebase_auth_services.dart';
import '../../../firebase/global/common/toast.dart';
import '../../MainScreen/main_scaffold.dart';
import '../SignIn/sign_up.dart';
import '../forgotPassword/forgot_password.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}


class _LogInScreenState extends State<LogInScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSigning = false;

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
          child: Container(
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/pexels-adrien-olichon-1257089-3137052.jpg'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  welcomeText(),
                  const SizedBox(
                    height: 25,
                  ),
                  logInText(),
                  const SizedBox(
                    height: 25,
                  ),
                  ExtPageTFF.UsualTFF(_emailController, Constant.appbarRed,
                      "E-Mail", "E-Mail", Icons.email),
                  const SizedBox(
                    height: 15,
                  ),
                  ExtPageTFF.UsualTFF(_passwordController, Constant.appbarRed,
                      "Password", "Password", Icons.password_outlined),
                  const SizedBox(
                    height: 15,
                  ),
                  forgotPassword(),
                  const SizedBox(
                    height: 15,
                  ),
                  ExtPageButton.ObjectButton(() => _signIn(), Constant.appbarRed,
                      "Sign In", _isSigning),
                  const SizedBox(
                    height: 15,
                  ),
                  orText(),
                  const SizedBox(
                    height: 15,
                  ),
                  OtherLogin(),
                  const SizedBox(
                    height: 50,
                  ),
                  signInText(),
                  const SizedBox(height: 230),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text welcomeText() {
    return Text(
      "Welcome",
      style: ExtPageText.TxtStyle(FontWeight.w700, 23, Constant.grey),
    );
  }

  Widget logInText() {
    return Text(
      "Log In",
      style: ExtPageText.TxtStyle(FontWeight.w700, 40, Constant.grey),
    );
  }

  GestureDetector signInText() {
    return GestureDetector(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Don't have a membership? ",
          style: ExtPageText.TxtStyle(FontWeight.w400, 15, Constant.black),
        ),
        Text(
          "Sign up",
          style: ExtPageText.TxtStyle(FontWeight.w700, 15, Constant.black),
        )
      ]),
      onTap: () {
        Grock.to(const SignUpScreen());
      },
    );
  }

  GestureDetector forgotPassword() {
    return GestureDetector(
      child: Text(
        "Forgot Password!",
        style: ExtPageText.TxtStyle(FontWeight.w500, 14, Constant.grey),
      ),
      onTap: () {
        Grock.to(const ForgotPassword());
      },
    );
  }

  Row orText() {
    return const Row(
      children: [
        Expanded(
            child: Divider(
              thickness: 2,
              color: Constant.grey,
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15), child: Text("or")),
        Expanded(
            child: Divider(
              thickness: 2,
              color: Constant.grey,
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
      showToastCorrect(message: "User is successfully signed in");
      Grock.to(MainScaffold());
    } else {
      showToastFail(message: "Some error happened");
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
}
