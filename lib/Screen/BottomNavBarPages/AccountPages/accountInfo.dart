import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quicksafe_project/constant/constant.dart';
import 'package:quicksafe_project/ext/text_form_field.dart';
import '../../../components/appbar/non_logo_appbar_model.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  final TextEditingController _userId = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cellphoneController = TextEditingController();
  final TextEditingController _createdDateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        setState(() {
          _userId.text = user.uid;
          _emailController.text = userDoc['email'];
          _cellphoneController.text = userDoc['cellPhone'];
          _passwordController.text = userDoc['password'];
          _createdDateController.text = userDoc['createdAt'];
        });
      }
    }
  }

  @override
  void dispose() {
    _userId.dispose();
    _emailController.dispose();
    _cellphoneController.dispose();
    _createdDateController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonLogoAppBarModel(getTitle: () => "Account Info"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ExtPageTFF.UsualEnabledFalseTFF(
              _userId,
              Constant.appbarRed,
              "User Id",
              "User Id",
              Icons.numbers,

            ),
            const SizedBox(height: 10),
            ExtPageTFF.UsualEnabledFalseTFF(
              _emailController,
              Constant.appbarRed,
              "e-Mail",
              "e-Mail",
              Icons.mail,

            ),
            const SizedBox(height: 10),
            ExtPageTFF.UsualEnabledFalseTFF(
              _cellphoneController,
              Constant.appbarRed,
              "cellPhone",
              "cellPhone",
              Icons.phone_android,

            ),
            const SizedBox(height: 10),
            ExtPageTFF.ObscureTextEnabledFalseTFF(
              _passwordController,
              Constant.appbarRed,
              "Password",
              "Password",
              Icons.password,
              true
            ),
            const SizedBox(height: 10),
            ExtPageTFF.UsualEnabledFalseTFF(
              _createdDateController,
              Constant.appbarRed,
              "Created Date",
              "Created Date",
              Icons.calendar_month,

            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _copyToClipboard,
              child: const Text("Copy User Id"),
            ),
          ],
        ),
      ),
    );
  }
  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _userId.text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("User Id copied to clipboard")),
    );
  }
}
