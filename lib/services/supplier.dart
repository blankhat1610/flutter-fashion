import 'package:fashion/model/supplier.dart';
import 'package:fashion/utils/request.dart';

/// Details page
class SupplierAPI {
  /// Get supplier data
  static Future<SupplierModel> getData() async {
    var response = await RequestUtil().get('/supplier');
    return SupplierModel.fromJson(response);
  }
}
