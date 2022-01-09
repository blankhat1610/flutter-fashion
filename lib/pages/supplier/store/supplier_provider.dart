/// supplier provider
import 'package:fashion/model/goods.dart';
import 'package:fashion/model/supplier.dart';
import 'package:fashion/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SupplierPageProvider with ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool loading = true;
  String supplierName = '';
  String contact = '';
  String phoneNum = '';
  String workTime = '';

  String supplierImgUrl = "";
  String introDuceText = '';

  List<GoodsList> supplierList = [];

  SupplierPageProvider() {
    /// Data loading
    initData();
  }

  Future initData({bool refresh = false}) async {
    SupplierModel res = await SupplierAPI.getData();
    supplierName = res.supplierName;
    contact = res.contact;
    phoneNum = res.phoneNum;
    workTime = res.workTime;
    supplierList = res.supplierList;
    supplierImgUrl = res.supplierImgUrl;
    introDuceText = res.introDuceText;
    loading = false;
    notifyListeners();
  }

  /// Pull up to load
  Future loadData({bool refresh = false}) async {
    SupplierModel res = await SupplierAPI.getData();
    supplierList += res.supplierList;
    loading = false;
    if (supplierList.length < 20) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
    notifyListeners();
  }
}
