import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(58),
        super(key: key);
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
