import 'package:cyberbracy_mpt_original_front/core/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/colors_theme.dart';
import '../const/images_url.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final PreferredSizeWidget? bottom;

  const AppBarCustom({
    super.key,
    this.title,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: title != null ? null : 130,
      bottom: bottom,
      actions: [
        GestureDetector(
          onTap: () =>
              Navigator.of(context).pushNamed(ChatBotRoute().routeName),
          child: Image.asset(
            ImagesUrl.chatBot,
            width: 35,
          ),
        ),
        const SizedBox(width: 15)
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

  // @override
  // Size get preferredSize => Size(
  //     0, kToolbarHeight +   (bottom?.preferredSize.height ?? == null ? 0 : bottom!.preferredSize.height));
  @override
  Size get preferredSize =>
      Size(0, _PreferredAppBarSize(bottom?.preferredSize.height).height);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.bottomHeight)
      : super.fromHeight(kToolbarHeight + (bottomHeight ?? 0));

  final double? bottomHeight;
}
