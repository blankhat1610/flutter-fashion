import 'package:fashion/model/category.dart';
import 'package:fashion/utils/request.dart';

/// Category page
class CateGoryAPI {
  /// Get classified data
  static Future<CateGoryModel> getData() async {
    var response = await RequestUtil().get('/category');
    // print(response);
    return CateGoryModel.fromJson(response);
  }
}
