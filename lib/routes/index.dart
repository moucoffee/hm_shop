//管理路由

import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

Widget getRootWidget(){
  return MaterialApp(
    initialRoute: "/login",
    routes:getRootRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/" : (context) => MainPage(), //主页路由
    "/login" : (context) => LoginPage(),
  };
}