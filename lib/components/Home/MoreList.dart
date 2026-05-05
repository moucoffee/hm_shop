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
        crossAxisAlignment: CrossAxisAlignment.start, // 文字左对齐
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
          SizedBox(height: 8), // 稍微缩小间距
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4), // 缩小内边距
            child: Text(
              widget.recommendList[index].name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 14), // 稍微缩小字号
            ),
          ),
          Spacer(), // 自动撑开，将价格推到底部
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Column( // 改为 Column 或更紧凑的 Row 防止价格溢出
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded( // 使用 Expanded 包裹价格，防止长价格溢出
                      child: Text.rich(
                        TextSpan(
                          text: "¥${widget.recommendList[index].price}",
                          style: TextStyle(
                            color: Colors.red, // 价格突出显示
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${widget.recommendList[index].payCount}人付款",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(height: 4),
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
        childAspectRatio: 0.65, // 进一步调低比例（增加高度），适配 iOS 渲染
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5), 
          child: _getChildren(index),
        );
      },
    );
  } 
}
