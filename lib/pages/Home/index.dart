import 'package:flutter/cupertino.dart';
import 'package:hm_shop/components/Home/Category.dart';
import 'package:hm_shop/components/Home/Hot.dart';
import 'package:hm_shop/components/Home/MoreList.dart';
import 'package:hm_shop/components/Home/Slider.dart';
import 'package:hm_shop/components/Home/Suggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<BannerItem> _bannerList = [
    BannerItem(
      id: "1",
      imgUrl:
          "https://pic.rmb.bdstatic.com/bjh/news/d784e0991477b5a84f4ed1de4f1693c7.png",
    ),
    BannerItem(
      id: "2",
      imgUrl:
          "https://img-nos.yiyouliao.com/alph/73c0cf110d2a14e92f48633db4a833c8.jpeg?yiyouliao_channel=vivo_image",
    ),
    BannerItem(
      id: "3",
      imgUrl:
          "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
    ),
  ];

  List<Widget> _getScrollChildern() {
    return [
      SliverToBoxAdapter(child: Slider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Category()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Suggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Hot()),
              SizedBox(width: 10),
              Expanded(child: Hot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      MoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildern());
  }
}
