import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:flutter/material.dart';

abstract final class SnackBarService {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static void showErrorMessage({
    required String title,
  }) {
    if (scaffoldKey.currentState != null) {
      var context = scaffoldKey.currentState!.context;
      final query = MediaQuery.of(context);
      final double height = query.size.height * 0.023 < 20
          ? 20
          : MediaQuery.of(context).size.height * 0.023;
      scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.startToEnd,
          backgroundColor: ColorTheme.red.withOpacity(.90),
          content: SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: height,
                  height: height,
                  child: Icon(
                    Icons.error,
                    size: height,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ],
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          margin: const EdgeInsets.all(12),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  static void showCompleteMessage({
    required String title,
  }) {
    if (scaffoldKey.currentState != null) {
      var context = scaffoldKey.currentState!.context;
      final query = MediaQuery.of(context);
      final double height = query.size.height * 0.023 < 20
          ? 20
          : MediaQuery.of(context).size.height * 0.023;
      scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.startToEnd,
          backgroundColor: Colors.white60.withOpacity(.90),
          content: SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: height,
                  height: height,
                  child: Icon(
                    Icons.check,
                    size: height,
                    color: ColorTheme.darkRed,
                  ),
                ),
              ],
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          margin: const EdgeInsets.all(12),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
