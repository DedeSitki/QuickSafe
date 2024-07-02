import 'package:flutter/material.dart';
import '../../constant/constant.dart';

class NonLogoIconAppBarModel extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String Function() getTitle;

  const NonLogoIconAppBarModel({super.key, required this.getTitle})
      : preferredSize = const Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constant.appbarRed,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Center(child: Text(getTitle())),
    );
  }
}
