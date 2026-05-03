import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            color: Colors.blue,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "分类${index}",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          );
        },
      ),
    );
  }
}
