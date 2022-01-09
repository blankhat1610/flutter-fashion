import 'package:fashion/model/detail.dart';
import 'package:fashion/utils/request.dart';

/// Details page
class DetailAPI {
  /// Get detailed data
  static Future<DetailModel> getData(id) async {
    var response = await RequestUtil().get('/home/' + id.toString());
    return DetailModel.fromJson(response);
  }
}
