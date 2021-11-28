import 'package:AiRi/model/category.dart';
import 'package:AiRi/utils/request.dart';

/// Category page
class CateGoryAPI {
  /// Get classified data
  static Future<CateGoryModel> getData() async {
    var response = await RequestUtil().get('/category');
    return CateGoryModel.fromJson(response);
  }
}
