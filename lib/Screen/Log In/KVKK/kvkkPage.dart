import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:quicksafe_project/Screen/Log%20In/SignIn/sign_up.dart';
import '../../../constant/constant.dart';
import '../../../ext/button.dart';

class KVKKPage extends StatefulWidget {
  const KVKKPage({super.key});

  @override
  State<KVKKPage> createState() => _KVKKPageState();
}

class _KVKKPageState extends State<KVKKPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PrivacyPolicyPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.grey300,
      appBar: AppBar(
        title: const Text('KVKK Notification'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Personal Data Protection Law (KVKK) Notification',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'This mobile application works in accordance with the provisions of KVKK in order to protect your personal data and ensure your privacy. Below you can find information about how your personal data is collected, used, stored and shared.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Personal Data Collected:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "When using the application, the following personal data may be collected:",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  "*Your first name, last name, and contact information (e-mail address, phone number, etc.)\n"
                  "*Geolocation information (optionally, for the use of location-based services)\n"
                  "*User interaction data, such as user preferences and purchase history",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Use of Personal Data:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "The personal data collected may be used for the following purposes:",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  "*Create an account, execute transactions, and complete your orders.)\n"
                  "*Provide you with special offers and campaigns\n"
                  "*Provide you with information about products and services\n"
                  "*Improve and personalize the app experience",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Personal Data Sharing:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Your personal data may be shared with third parties in accordance with legal regulations and only for the specified purposes. These shares may be within the framework of cooperating service providers or legal requirements.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Personal Data Security:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "We take the necessary technical and organizational measures to protect your personal data. For data security purposes, measures such as appropriate encryption methods and access controls are taken.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                const Text(
                  'KVKK Rights:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Within the scope of the rights granted to you within the scope of the KVKK, you have rights such as receiving information, data correction, data deletion and data transfer regarding the processing of your personal data. You can contact us to exercise these rights.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  "This notice states that we process and protect your personal data in accordance with the provisions of the KVKK. By using the App, you agree to these terms.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                ExtPageButton.PrimaryButton(
                    btnfunc, Constant.appbarRed, "I Have Read and Approve")
              ],
            ),
          ),
        ),
      ),
    );
  }

  void btnfunc() {
    Grock.to(const SignUpScreen());
  }
}
