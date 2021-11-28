import 'package:AiRi/model/detail.dart';
import 'package:AiRi/utils/request.dart';

/// Details page
class DetailAPI {
  /// Get detailed data
  static Future<DetailModel> getData() async {
    var response = await RequestUtil().get('/detail');
    return DetailModel.fromJson(response);
  }
}
