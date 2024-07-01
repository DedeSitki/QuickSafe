import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:quicksafe_project/components/appbar/custom_appbar.dart';

import 'friendDetail.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({super.key});


  @override
  State<FriendsList> createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> friend_requests = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('friend_requests').get();
      setState(() {
        friend_requests = querySnapshot.docs
            .where((doc) => doc.data() != null && (doc.data() as Map<String, dynamic>).containsKey('to'))
            .map((doc) => (doc.data() as Map<String, dynamic>)['to'] as String)
            .toList();
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView.builder(
        itemCount: friend_requests.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Grock.to(const FriendDetail());
            },
            child: ListTile(
              title: Text(friend_requests[index]),
            ),
          );
        },
      ),
    );
  }
}
