import 'package:fashion/model/detail.dart';
import 'package:fashion/utils/request.dart';

/// Details page
class DetailAPI {
  /// Get detailed data
  static Future<DetailModel> getData() async {
    var response = await RequestUtil().get('/detail');
    return DetailModel.fromJson(response);
  }
}
