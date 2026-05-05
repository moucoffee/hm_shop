import 'package:hm_shop/contants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tokenmanager {

  //返回持久化对象的实例对象
  Future<SharedPreferences>  _getInstance() {
    return SharedPreferences.getInstance();
  }

  String _token = "";

  init() async {
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalContants.TOKEN_KEY) ?? " ";
  }

  Future<void> setToken(String val) async {
    final prefs = await _getInstance();
    prefs.setString(GlobalContants.TOKEN_KEY, val);
    _token = val;
  }

  String getToken() {
    return _token;
  }

  Future<void> removeToken() async {
    final prefs = await _getInstance();
    prefs.remove(GlobalContants.TOKEN_KEY); //磁盘
    _token = ""; //内存
  }
}

final tokenmanager = Tokenmanager();