import 'package:flutter/material.dart';
import '../../constant/constant.dart';

class NonLogoIconAppBarModel extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final String Function() getTitle;

  NonLogoIconAppBarModel({Key? key, required this.getTitle})
      : preferredSize = const Size.fromHeight(66),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constant.green500,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Center(child: Text(getTitle())),
      ),
    );
  }
}
