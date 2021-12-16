import 'package:fashion/model/category.dart';
import 'package:fashion/services/services.dart';
import 'package:flutter/foundation.dart';

class CateGoryPageProvider with ChangeNotifier {
  bool loading = true;
  late List<CategoryDatum> categoryData;

  CateGoryPageProvider() {
    /// Data loading
    initData();
  }

  Future initData() async {
    CateGoryModel res = await CateGoryAPI.getData();

    /// Download Data
    categoryData = res.categoryData;
    loading = false;
    notifyListeners();
  }
}
