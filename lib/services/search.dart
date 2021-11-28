import 'package:AiRi/model/search.dart';
import 'package:AiRi/utils/request.dart';

/// Search page
class SearchAPI {
  /// Search data
  static Future<SearchModel> searchData({required String keyword}) async {
    var response = await RequestUtil().get(
      '/search',
      params: {"keyword": keyword},
    );
    return SearchModel.fromJson(response);
  }
}
