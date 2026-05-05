import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hm_shop/api/user.dart';
import 'package:hm_shop/stores/TokenManager.dart';
import 'package:hm_shop/stores/userController.dart';
import 'package:hm_shop/utils/ToastUtils.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  final UserController _userController = Get.find();
  Widget _bulidHeader() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "账号密码登录",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildPhoneTextField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) return "手机号不能为空";
        if (!RegExp(r"^1[3-9]\d{9}$").hasMatch(value)) return "手机格式不正确";
        return null;
      },
      controller: _phoneController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        hintText: "请输入账号",
        fillColor: const Color.fromRGBO(243, 243, 243, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  Widget _buildCodeTextField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) return "密码不能为空";
        if (!RegExp(r"^[a-zA-Z0-9_]{6,16}$").hasMatch(value)) return "密码格式不正确";
        return null;
      },
      obscureText: true,
      controller: _codeController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        fillColor: const Color.fromRGBO(243, 243, 243, 1),
        filled: true,
        hintText: "请输入密码",
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  bool _isChanged = false;

  Widget _buildCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _isChanged,
          activeColor: Colors.black,
          checkColor: Colors.white,
          onChanged: (bool? value) {
            _isChanged = value ?? false;
            setState(() {});
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          side: BorderSide(color: Colors.grey, width: 2.0),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "查看并同意"),
              TextSpan(
                text: "《隐私条款》",
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(text: "和"),
              TextSpan(
                text: "《用户协议》",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _login() async {
    try{
      final res = await loginAPI({
        "account" : _phoneController.text,
        "password": _codeController.text,
      });
      _userController.updateUserInfo(res);
      tokenmanager.setToken(res.token); 
      Toastutils.showToast(context, "登录成功");
      Navigator.pop(context);
    } catch(e) {
      Toastutils.showToast(context, (e as DioException).message);
    }
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_key.currentState!.validate()) {
            if (_isChanged) {
              _login();
            } else {
              Toastutils.showToast(context, "请勾选用户协议");
            }
          }
          ;
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        child: Text("登录", style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录", style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: Form(
        key: _key,
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 20),
              _bulidHeader(),
              SizedBox(height: 20),
              _buildPhoneTextField(),
              SizedBox(height: 20),
              _buildCodeTextField(),
              SizedBox(height: 20),
              _buildCheckbox(),
              SizedBox(height: 20),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
