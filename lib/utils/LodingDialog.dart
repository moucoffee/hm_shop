import 'package:flutter/material.dart';

class LoadingDialog {
  static void show(BuildContext context, {String message = "加载中..."}) {
    showDialog(
      context: context,
      barrierDismissible: false, // 点击背景不关闭
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent, // 背景透明，只显示内部 Container
          elevation: 0, // 去掉阴影
          child: Center(
            child: Container(
              width: 120, // 设置固定宽度
              height: 120, // 设置固定高度
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 15),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context){
    Navigator.pop(context);
  }
}