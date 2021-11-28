import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:AiRi/model/goods.dart';
import 'package:AiRi/model/search.dart';
import 'package:AiRi/services/search.dart';

class SearchPageProvider with ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List<GoodsList> result = [];
  bool loading = true;

  SearchPageProvider() {
    /// Data loading
    searchData(keyword: '');
    notifyListeners();
  }
  Future searchData({bool refresh = false, required String keyword}) async {
    // print(keyword);
    loading = true;

    /// The keyword here is empty, it needs to be judged later
    SearchModel res = await SearchAPI.searchData(keyword: keyword);

    /// First load
    result = res.result;
    loading = false;

    /// Pull down to refresh
    if (refresh) {
      refreshController.refreshCompleted();
    }
    notifyListeners();
  }

  /// Pull up to load
  Future loadData({bool refresh = false, required String keyword}) async {
    SearchModel res = await SearchAPI.searchData(keyword: keyword);
    result += res.result;
    if (result.length < 20) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
    notifyListeners();
  }
}
