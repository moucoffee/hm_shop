import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Suggestion extends StatefulWidget {
  //特惠推荐
  SpecialRecommendResult specialRecommendResult;
  Suggestion({Key? key, required this.specialRecommendResult})
    : super(key: key);

  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  List<GoodsItem> _getDisplayItems() {
    if (widget.specialRecommendResult.subTypes.isEmpty) return [];
    return widget.specialRecommendResult.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            color: const Color.fromARGB(255, 106, 0, 0),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "精选省攻略",
          style: TextStyle(color: const Color.fromARGB(255, 128, 76, 76)),
        ),
      ],
    );
  }

  Widget _buildleft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("lib/assets/home_cmd_inner.png"),
        ),
      ),
    );
  }

  List<Widget> _getChildrenList() {
    List<GoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (int index) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "lib/assets/home_cmd_inner.png",
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                );
              },
              list[index].picture,
              width: 80,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 111, 0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "¥${list[index].price}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("lib/assets/home_cmd_sm.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              children: [
                _buildleft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getChildrenList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
