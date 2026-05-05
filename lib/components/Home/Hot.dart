import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Hot extends StatefulWidget {
  SpecialRecommendResult result;
  String type;
  Hot({Key? key, required this.result, required this.type}) : super(key: key);

  @override
  _HotState createState() => _HotState();
}

class _HotState extends State<Hot> {
  List<GoodsItem> _getDisplayItems() {
    if (widget.result.subTypes.isEmpty) return [];
    return widget.result.subTypes.first.goodsItems.items.take(2).toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.type == "step" ? "一站买全" : "爆款推荐",
          style: TextStyle(
            color: const Color.fromARGB(255, 106, 0, 0),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.type == "step" ? "精心优选" : "最受欢迎",
          style: TextStyle(color: const Color.fromARGB(255, 128, 76, 76)),
        ),
      ],
    );
  }

  List<Widget> _getChildrenList() {
    List<GoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (int index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "lib/assets/home_cmd_inner.png",
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                );
              },
              list[index].picture,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10,),
          Container(child: Text("¥${list[index].price}")),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: widget.type == "step"
              ? const Color.fromARGB(255, 5, 218, 255)
              : const Color.fromARGB(255, 217, 255, 0),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _getChildrenList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
