import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Myslider extends StatefulWidget {
  final List<BannerItem> bannerList;
  Myslider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Myslider> {
  CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //获取屏幕宽度
    final double screanWidth = MediaQuery.of(context).size.width;

    Widget _getSlider() {
      return CarouselSlider(
        carouselController: _controller,
        items: List.generate(widget.bannerList.length, (index) {
          return Image.network(
            widget.bannerList[index].imgUrl,
            fit: BoxFit.cover,
            width: screanWidth,
          );
        }),
        options: CarouselOptions(
          height: 200,
          viewportFraction: 1,
          autoPlay: true,
          onPageChanged: (index, reason) {
            _currentIndex = index;
            setState(() {});
          },
        ),
      );
    }

    Widget _getSearch() {
      return Positioned(
        left: 0,
        right: 0,
        top: 10,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, 0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "搜索",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      );
    }

    Widget _getDots() {
      return Positioned(
        left: 0,
        right: 0,
        bottom: 10,
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.bannerList.length, (index) {
              return GestureDetector(
                onTap: () {
                  _controller.jumpToPage(index);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: _currentIndex == index ? 40 : 20,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.white : 
                    Color.fromRGBO(0, 0, 0, 0.3),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            }),
          ),
        ),
      );
    }

    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
  }
}
