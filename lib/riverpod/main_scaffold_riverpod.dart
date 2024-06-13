import 'package:flutter/material.dart';
import 'package:quicksafe_project/Screen/BottomNavBarPages/account.dart';
import 'package:quicksafe_project/Screen/BottomNavBarPages/friends.dart';
import 'package:quicksafe_project/Screen/BottomNavBarPages/home.dart';
import 'package:quicksafe_project/Screen/BottomNavBarPages/location.dart';
import 'package:quicksafe_project/Screen/BottomNavBarPages/moods.dart';
import '../model/navbar_model/bottom_navbar_model.dart';


class MainScaffoldRiverpod extends ChangeNotifier {
  List<BottomNavBarModel> items = [
    BottomNavBarModel(image: "assets/icons/icons8-home-50.png", title: "Home"),
    BottomNavBarModel(image: "assets/icons/icons8-place-marker-50.png", title: "Location"),
    BottomNavBarModel(image: "assets/icons/icons8-friends-48.png", title: "Friends"),
    BottomNavBarModel(image: "assets/icons/icons8-ask-50.png", title: "Moods"),
    BottomNavBarModel(image: "assets/icons/icons8-user-folder-50.png", title: "Account"),
  ];

  int currentIndex = 0;
  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return Home();
      case 1:
        return Location();
      case 2:
        return Friends();
      case 3:
        return Moods();
      case 4:
        return Account();
      default:
        return Home();
    }
  }
}
