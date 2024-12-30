import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum AppToastType { success, error, warning }

class AppToast {
  static final FToast _fToast = FToast();

  static void showToast(String message,
      {BuildContext? context,
      AppToastType type = AppToastType.error,
      bool isThereNavBar = false}) {
    if (context != null) _fToast.init(context);

    Color color = type == AppToastType.error
        ? const Color(0xffFCE6E8)
        : type == AppToastType.success
            ? const Color(0xffE7F8EB)
            : const Color(0xffFCF6E4);
    _fToast.showToast(
      child: _toastContainer(message, color, type, context),
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
    );
  }

  static Widget _toastContainer(String message, Color color, AppToastType type,
          BuildContext? context) =>
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 5.0,
              offset: const Offset(0, 3),
            ),
          ],
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (type == AppToastType.error)
                    SvgPicture.asset(Assets.images.svg.toastErrorIcon.path)
                  else
                    SvgPicture.asset(Assets.images.svg.toastSuccessIcon.path),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      message,
                      style: TextStyle(
                          fontSize: AppDimensions.getFonTSize14,
                          fontWeight: TextStyleBlueprint.regularFontWeight,
                          color: StaticColors.black_735),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10.0),
            SizedBox(
              width: 20,
              height: 20,
              child: InkWell(
                onTap: () {
                  //hide toast
                  _fToast.removeCustomToast();
                },
                child: const Icon(
                  Icons.close,
                  size: 20,
                  color: StaticColors.black_735,
                ),
              ),
            ),
          ],
        ),
      );

  static void showWebToast(String message, {String? hexColor}) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        fontAsset: "assets/fonts/Almarai/Almarai-Regular.ttf",
        timeInSecForIosWeb: 3,
        textColor: Colors.white,
        webShowClose: true,
        webPosition: "center",
        webBgColor: hexColor ?? "#F44336");
  }
}
