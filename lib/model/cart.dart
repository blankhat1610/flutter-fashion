import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  final int id;
  @JsonKey(name: 'customer_id')
  final int customerId;
  @JsonKey(name: 'product_id')
  final int productId;
  @JsonKey(name: 'pty')
  final int quantity;
  final int price;
  final String thumb;
  final String name;
  final String description;


  Cart(this.id, this.customerId, this.productId, this.quantity, this.price,
      this.thumb, this.name, this.description);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}