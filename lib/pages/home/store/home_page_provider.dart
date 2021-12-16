import 'package:fashion/model/goods.dart';
import 'package:fashion/model/home.dart';
import 'package:fashion/services/home.dart';
import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePageProvider with ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool loading = true;
  List<String> banerList = [];
  List<BrandListElement> cateGoryList = [];
  List<BrandListElement> brandList = [];
  List<GoodsList> hotList = [];

  HomePageProvider() {
    /// Homepage data loading
    initData();
  }
  Future initData({bool refresh = false}) async {
    HomeModel res = await HomeAPI.getHomeData();

    /// First load
    banerList = res.banerList;
    cateGoryList = res.cateGoryList;
    brandList = res.brandList;
    hotList = res.hotList;
    loading = false;

    /// Pull down to refresh
    if (refresh) {
      banerList = res.banerList;
      cateGoryList = res.cateGoryList;
      brandList = res.brandList;
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
