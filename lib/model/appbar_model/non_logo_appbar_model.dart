import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grock/grock.dart';

import '../../constant/constant.dart';

class NonLogoAppBarModel extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final String Function() getTitle;

  NonLogoAppBarModel({Key? key, required this.getTitle})
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
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Grock.back();
                },
                child: SvgPicture.asset("assets/icons/back.svg",
                    color: Colors.white)),
            Expanded(child: Center(child: Text(getTitle()))),
            SizedBox(width: 35,)
          ],
        ),
      ),
    );
  }
}
