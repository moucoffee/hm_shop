import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Slider extends StatefulWidget {
  Slider({Key? key}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("轮播图", style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),),
    );
  }
}