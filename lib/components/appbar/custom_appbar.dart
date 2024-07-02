import 'package:flutter/material.dart';
import '../../constant/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(58);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constant.appbarRed,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Image.asset("assets/icons/quicksafe-buyuk-appbar-red.png"),
      toolbarHeight: 55,
    );
  }
}
