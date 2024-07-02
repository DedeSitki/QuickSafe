import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:flutter/services.dart';
import 'package:quicksafe_project/components/appbar/non_logo_appbar_model.dart';
import 'package:quicksafe_project/constant/constant.dart';
import 'package:quicksafe_project/ext/button.dart';

import 'friendDetail.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({super.key});

  @override
  State<FriendsList> createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, String>> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('users').get();
      setState(() {
        users = querySnapshot.docs
            .where((doc) =>
        doc.data() != null &&
            (doc.data() as Map<String, dynamic>).containsKey('fullanme'))
            .map((doc) => {
          'id': doc.id,
          'fullanme': (doc.data() as Map<String, dynamic>)['fullanme'] as String,
        })
            .toList();
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching users: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NonLogoAppBarModel(getTitle: () => "Friends List"),
      body: users.isEmpty
          ? const Center(child: CircularProgressIndicator()) // Veri yüklenene kadar bir progress indicator göster
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user['fullanme'] ?? ''),
            subtitle: GestureDetector(
              onTap: () {
                final userId = user['id'];
                if (userId != null) {
                  Clipboard.setData(ClipboardData(text: userId));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('ID kopyalandı: $userId'),
                    ),
                  );
                }
              },
              child: Text(user['id'] ?? ''),
            ),
          );
        },
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(left: 50, right: 20),
        child: ExtPageButton.PrimaryButton(() {
          Grock.to(const FriendDetail());
        }, Constant.appbarRed, "Check Friend Detail"),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: FriendsList(),
  ));
}
