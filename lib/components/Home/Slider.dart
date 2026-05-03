import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Slider extends StatefulWidget {
  final List<BannerItem> bannerList;
  Slider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  @override
  Widget build(BuildContext context) {
    final double screanWidth = MediaQuery.of(context).size.width;

    Widget _getSlider() {
      return CarouselSlider(
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
        ),
      );
    }

    return Stack(children: [_getSlider()]);
  }
}
