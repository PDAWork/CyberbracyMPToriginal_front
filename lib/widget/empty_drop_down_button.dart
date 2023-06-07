import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EmptyDropDownButton extends StatelessWidget {
  const EmptyDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            border: Border.all(
              color: ColorTheme.darkRed,
            ),
          ),
          width: size.width,
          child: Shimmer.fromColors(
            period: const Duration(seconds: 2),
            baseColor: Colors.white.withOpacity(.1),
            highlightColor: ColorTheme.darkRed.withOpacity(.1),
            child: Container(
              color: Colors.white,
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
