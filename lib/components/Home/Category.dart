import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Category extends StatefulWidget {
  //分类列表
  final List<CategoryItem> categoryList;
  Category({Key? key, required this.categoryList}) : super(key: key);

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
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.categoryList[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 232, 234, 236),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  item.picture,
                  width: 30,
                  height: 30,
                ),
                Text(
                  item.name,
                  style: TextStyle(color: Colors.black, fontSize: 9),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
