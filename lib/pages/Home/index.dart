import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/Category.dart';
import 'package:hm_shop/components/Home/Hot.dart';
import 'package:hm_shop/components/Home/MoreList.dart';
import 'package:hm_shop/components/Home/Suggestion.dart';
import 'package:hm_shop/components/Home/mySlider.dart';
import 'package:hm_shop/utils/ToastUtils.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<GoodDetailItem> _recommendList = [];

  //一站式推荐
  SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

  //热榜推荐
  SpecialRecommendResult _inVogueResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

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
      SliverToBoxAdapter(child: Myslider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Category(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Suggestion(specialRecommendResult: _specialRecommendResult),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Hot(result: _inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Hot(result: _oneStopResult, type: "step"),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      MoreList(recommendList: _recommendList),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getProductList();
    _getInVogueList();
    _getOneStopList();
    _getRecommendList();
    _registerEvent();
  }

  void _registerEvent() {
    _controller.addListener(() {
      if (_controller.position.pixels >=
          (_controller.position.maxScrollExtent - 50)) {
        _getRecommendList();
      }
    });
  }

  int _page = 1;
  bool _isloading = false; //当前正在加载
  bool _hasMore = true; //是否还有下一页

  Future<void> _getRecommendList() async {
    if (_isloading || !_hasMore) return;
    _isloading = true;
    int requestLimit = _page * 8;
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    _isloading = false;
    setState(() {});
    if (_recommendList.length < requestLimit) {
      _hasMore = false;
      return;
    }
    _page++;
  }

  //获取一站式推荐
  Future<void> _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  //获取热榜推荐
  Future<void> _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  //获取特惠推荐
  Future<void> _getProductList() async {
    _specialRecommendResult = await getProductListAPI();
    setState(() {});
  }

  //获取分类列表
  Future<void> _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  //获取轮播图列表
  Future<void> _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  Future<void> _onRefresh() async {
    _page = 1;
    _isloading = false;
    _hasMore = true;
    await _getBannerList();
    await _getCategoryList();
    await _getProductList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();

    Toastutils.showToast(context, "刷新成功");
  }

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CustomScrollView(
        slivers: _getScrollChildern(),
        controller: _controller,
      ),
    );
  }
}
