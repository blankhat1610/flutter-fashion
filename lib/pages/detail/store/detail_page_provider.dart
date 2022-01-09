/// detail provider
import 'package:fashion/model/detail.dart';
import 'package:fashion/services/services.dart';
import 'package:flutter/foundation.dart';

class DetailPageProvider with ChangeNotifier {
  final int goodsId;
  bool loading = true;
  // List<String> bannerList = [];
  // String contact = '';
  String name = '';
  // String brandName = '';
  // String goodsSeries = '';
  String price = '';
  // String supplierId = '';
  // String supplierName = '';
  // String supplierCode = '';
  // String platformCode = '';
  // String produceTime = '';
  // String guidePrice = '';
  // String miniBuyNum = '';
  String image = '';
  // List<SpecificationList> specificationList = [];

  DetailPageProvider(this.goodsId) {
    /// Data loading
    initData();
  }

  Future initData() async {
    DetailModel res = await DetailAPI.getData(this.goodsId);
    // print(res.specificationList);
    // bannerList = res.bannerList;
    // contact = res.contact;
    name = res.name;
    // brandName = res.brandName;
    // goodsSeries = res.goodsSeries;
    price = res.price.toString();
    // supplierId = res.supplierId;
    // supplierName = res.supplierName;
    // supplierCode = res.supplierCode;
    // platformCode = res.platformCode;
    // produceTime = res.produceTime;
    // guidePrice = res.guidePrice;
    // miniBuyNum = res.miniBuyNum;
    image = res.image;
    // specificationList = res.specificationList;
    loading = false;
    notifyListeners();
  }
}
