/// detail provider
import 'package:fashion/model/detail.dart';
import 'package:fashion/services/services.dart';
import 'package:flutter/foundation.dart';

class DetailPageProvider with ChangeNotifier {
  bool loading = true;
  List<String> bannerList = [];
  String contact = '';
  String goodsName = '';
  String brandName = '';
  String goodsSeries = '';
  String price = '';
  String supplierId = '';
  String supplierName = '';
  String supplierCode = '';
  String platformCode = '';
  String produceTime = '';
  String guidePrice = '';
  String miniBuyNum = '';
  String goodsImgUrl = '';
  List<SpecificationList> specificationList = [];

  DetailPageProvider() {
    /// Data loading
    initData();
  }

  Future initData() async {
    DetailModel res = await DetailAPI.getData();
    // print(res.specificationList);
    bannerList = res.bannerList;
    contact = res.contact;
    goodsName = res.goodsName;
    brandName = res.brandName;
    goodsSeries = res.goodsSeries;
    price = res.price;
    supplierId = res.supplierId;
    supplierName = res.supplierName;
    supplierCode = res.supplierCode;
    platformCode = res.platformCode;
    produceTime = res.produceTime;
    guidePrice = res.guidePrice;
    miniBuyNum = res.miniBuyNum;
    goodsImgUrl = res.goodsImgUrl;
    specificationList = res.specificationList;
    loading = false;
    notifyListeners();
  }
}