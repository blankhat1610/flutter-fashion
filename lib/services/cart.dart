import 'package:fashion/model/cart.dart';
import 'package:fashion/model/message.dart';
import 'package:fashion/utils/request.dart';

class CartApi {
  static Future<List<Cart>> getItemsInCart() async {
    final List<dynamic> response = await RequestUtil().get('/cart');
    final list = response.map((cartJson) => Cart.fromJson(cartJson)).toList();
    print(list);
    return list;
  }

  static Future<Message> deleteCart(String id) async {
    final response = await RequestUtil().delete('/cart/$id');
    return Message.fromJson(response);
  }

  static Future<void> addToCart(int productId, int quantity, int price) async {
    await RequestUtil().post('/cart', params: {
      "product_id": productId,
      "quantity": quantity,
      "price": price
    });
  }

  static Future<void> submitOrder() async {
    await RequestUtil().get('/checkout');
  }

  static Future<void> buyNow(int id) async {
    await RequestUtil().get('/buynow-checkout/$id');
  }
}