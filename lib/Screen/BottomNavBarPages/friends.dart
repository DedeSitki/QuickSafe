import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:grock/grock.dart';
import 'package:quicksafe_project/Screen/BottomNavBarPages/friendsList/friendsList.dart';
import 'package:quicksafe_project/constant/constant.dart';
import 'package:quicksafe_project/ext/button.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController userIdController = TextEditingController();
  String searchResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                searchUserIdField(),
                const SizedBox(height: 16.0),
                searchUserIdFieldButton(),
                const SizedBox(height: 16.0),
                if (searchResult.isNotEmpty) ...[
                  ListTile(
                    title: Text(searchResult),
                    trailing: ElevatedButton(
                      onPressed: () {
                        sendFriendRequest(searchResult);
                      },
                      child: const Text('Gönder'),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: showFriendsButton(),
            ),
        ],
      ),
    );
  }

  void searchUserByUID(String uid) async {
    try {
      DocumentSnapshot documentSnapshot = await firestore
          .collection('users')
          .doc(uid)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          searchResult = documentSnapshot['email'];
        });
      } else {
        setState(() {
          searchResult = '';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kullanıcı bulunamadı.')),
        );
      }
    } catch (e) {
      print('Error searching user: $e');
      setState(() {
        searchResult = '';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bir hata oluştu.')),
      );
    }
  }

  void sendFriendRequest(String userEmail) {
    final User? user = FirebaseAuth.instance.currentUser;
    final currentUserEmail = user?.email;

    if (currentUserEmail != null) {
      firestore.collection('friend_requests').add({
        'from': currentUserEmail,
        'to': userEmail,
        'timestamp': FieldValue.serverTimestamp(),
      }).then((_) {
        print('$userEmail kullanıcıya arkadaşlık isteği gönderildi.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$userEmail kullanıcısına arkadaşlık isteği gönderildi.')),
        );
      }).catchError((error) {
        print('Arkadaşlık isteği gönderilemedi: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Arkadaşlık isteği gönderilemedi.')),
        );
      });
    } else {
      print('Giriş yapan kullanıcı bulunamadı.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Giriş yapan kullanıcı bulunamadı.')),
      );
    }
  }

  Widget searchUserIdField() {
    return TextField(
      controller: userIdController,
      decoration: InputDecoration(
        labelText: 'Search user id',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.copy),
          onPressed: () {
            final text = userIdController.text;
            if (text.isNotEmpty) {
              Clipboard.setData(ClipboardData(text: text));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Kopyalandı')),
              );
            }
          },
        ),
      ),
    );
  }

  Widget searchUserIdFieldButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: ExtPageButton.PrimaryButton(() {
        searchUserByUID(userIdController.text);
      }, Constant.appbarRed, "Search"),
    );
  }

  Widget showFriendsButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: ExtPageButton.PrimaryButton(() {
        Grock.to(const FriendsList());
      }, Constant.appbarRed, "Show Friends"),
    );
  }
}

void main() => runApp(const MaterialApp(home: Friends()));
