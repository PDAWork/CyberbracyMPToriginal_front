import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/colors_theme.dart';
import '../const/images_url.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const AppBarCustom({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: title != null ? null : 130,
      actions: [
        Image.asset(
          ImagesUrl.chat_bot,
          width: 35,
        ),
        SizedBox(width: 15)
      ],
      foregroundColor: ColorTheme.red,
      leading: title != null
          ? null
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: SvgPicture.asset(
                    ImagesUrl.logo,
                    height: 35,
                  ),
                ),
                const Text(
                  'Открытый\nконтроль',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
      centerTitle: true,
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(color: Colors.black),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size(0, kToolbarHeight);
}
