import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class MoreList extends StatefulWidget {
  final List<GoodDetailItem> recommendList;
  MoreList({Key? key, required this.recommendList}) : super(key: key);

  @override
  _MoreListState createState() => _MoreListState();
}

class _MoreListState extends State<MoreList> {
  Widget _getChildren(int index) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "lib/assets/home_cmd_inner.png",
                    fit: BoxFit.cover,
                  );
                },
                widget.recommendList[index].picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.recommendList[index].name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "¥${widget.recommendList[index].price}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: "¥${widget.recommendList[index].price}",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 10,
                        )
                      )
                    ],
                  ),
                ),
                Text(
                  "${widget.recommendList[index].payCount}人付款",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.recommendList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: _getChildren(index),
        );
      },
    );
  }
}
