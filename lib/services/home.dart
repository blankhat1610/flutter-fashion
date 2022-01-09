import 'package:fashion/model/home.dart';
import 'package:fashion/utils/request.dart';

/// front page
class HomeAPI {
  /// Get homepage data
  static Future<HomeModel> getHomeData() async {
    var response = await RequestUtil().get('/home');
    return HomeModel.fromJson(response);
  }
}
