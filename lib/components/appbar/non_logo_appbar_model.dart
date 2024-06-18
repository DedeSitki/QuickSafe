import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import '../../constant/constant.dart';

class NonLogoAppBarModel extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String Function() getTitle;

  const NonLogoAppBarModel({super.key, required this.getTitle})
      : preferredSize = const Size.fromHeight(53);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constant.appbarRed,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Grock.back();
                },
                child:
                    Image.asset("assets/icons/back.png", color: Colors.white)),
            Expanded(
                child: Center(
                    child: Text(getTitle(),
                        style: const TextStyle(color: Constant.white)))),
            const SizedBox(
              width: 35,
            )
          ],
        ),
    );
  }
}
