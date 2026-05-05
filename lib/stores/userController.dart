import 'package:get/get.dart';
import 'package:hm_shop/viewmodels/user.dart';

class UserController extends GetxController{
  var user = UserInfo.fromJSON({}).obs; //user对象被监听了
  //想要取值的话得user.value
  updateUserInfo(UserInfo newUser) {
    user.value = newUser;
  }
}