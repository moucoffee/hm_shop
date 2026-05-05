import 'package:flutter/material.dart';

class Toastutils {
  static bool showLogin = false;

  static void showToast(BuildContext context, String? msg) {

    if(Toastutils.showLogin) return;

    showLogin = true;
    Future.delayed(Duration(seconds: 3), () => showLogin = false);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      width: 150,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(40),
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      content: Text(msg ?? "加载成功", textAlign: TextAlign.center,),
    ));
  }
}