import 'package:AiRi/model/supplier.dart';
import 'package:AiRi/utils/request.dart';

/// Details page
class SupplierAPI {
  /// Get supplier data
  static Future<SupplierModel> getData() async {
    var response = await RequestUtil().get('/supplier');
    return SupplierModel.fromJson(response);
  }
}
