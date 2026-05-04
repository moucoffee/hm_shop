import 'package:flutter/cupertino.dart';
import 'package:hm_shop/api/home.dart';
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
  //特惠推荐
  SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );
  //分类列表
  List<CategoryItem> _categoryList = [];
  //轮播图列表
  List<BannerItem> _bannerList = [];
    //[
  //   BannerItem(
  //     id: "1",
  //     imgUrl:
  //         "https://pic.rmb.bdstatic.com/bjh/news/d784e0991477b5a84f4ed1de4f1693c7.png",
  //   ),
  //   BannerItem(
  //     id: "2",
  //     imgUrl:
  //         "https://img-nos.yiyouliao.com/alph/73c0cf110d2a14e92f48633db4a833c8.jpeg?yiyouliao_channel=vivo_image",
  //   ),
  //   BannerItem(
  //     id: "3",
  //     imgUrl:
  //         "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
  //   ),
  // ];

  List<Widget> _getScrollChildern() {
    return [
      SliverToBoxAdapter(child: Slider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Category(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Suggestion(specialRecommendResult: _specialRecommendResult)),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getProductList();
  }

  //获取特惠推荐
  void _getProductList() async {
    _specialRecommendResult = await getProductListAPI();
    setState(() {});
  }

  //获取分类列表
  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  //获取轮播图列表
  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildern());
  }
}
