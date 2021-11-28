import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:AiRi/model/goods.dart';
import 'package:AiRi/model/home.dart';
import 'package:AiRi/services/services.dart';

class ManagePageProvider with ChangeNotifier {
  bool loading = true;
  List<GoodsList> hotList = [];
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  ManagePageProvider() {
    /// Homepage data loading
    initData();
  }
  Future initData({bool refresh = false}) async {
    HomeModel res = await HomeAPI.getHomeData();
    hotList = res.hotList;
    loading = false;

    /// Pull down to refresh
    if (refresh) {
      hotList = res.hotList;
      loading = false;
      refreshController.refreshCompleted();
    }
    notifyListeners();
  }

  /// Pull up to load
  Future loadData({bool refresh = false}) async {
    HomeModel res = await HomeAPI.getHomeData();
    hotList += res.hotList;
    loading = false;
    if (hotList.length < 20) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
    notifyListeners();
  }
}
