import 'package:hm_shop/contants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

//get所获取的json数据格式如下
// “result” : [
//   {
//     "id" : "",
//     "imgUrl" : "",
//     ...
//   },
//   {

//   },
//   ...
// ]

// item将每一个id，imgUrl送入BannerItem工厂返回一个个BannerItem实例

Future<List<BannerItem>> getBannerListAPI() async {
  return ((await dioRequest.get(HttpContants.BANNER_LIST)) as List).map((item) {
    return BannerItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}
