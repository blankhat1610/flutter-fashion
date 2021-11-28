import 'package:AiRi/model/home.dart';
import 'package:AiRi/utils/request.dart';

/// front page
class HomeAPI {
  /// Get homepage data
  static Future<HomeModel> getHomeData() async {
    var response = await RequestUtil().get('/index');
    return HomeModel.fromJson(response);
  }
}
