import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grock/grock.dart';
import 'package:quicksafe_project/Screen/BottomNavBarPages/friendsList/friendsList.dart';

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController emailController = TextEditingController();
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
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-posta adresi ara',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    searchUserByEmail(emailController.text);
                  },
                  child: const Text('Ara'),
                ),
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
          Positioned(
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                Grock.to(FriendsList());
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.blue,
                child: const Text(
                  "Show Friends",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void searchUserByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          searchResult = querySnapshot.docs.first['email'];
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
}

void main() => runApp(const MaterialApp(home: Friends()));
