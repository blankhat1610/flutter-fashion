/// Product list Model
class GoodsList {
  int id;
  int price;
  String name;
  String image;

  GoodsList({
    required this.id,
    required this.price,
    required this.name,
    required this.image,
  });

  factory GoodsList.fromJson(Map<String, dynamic> json) => GoodsList(
        id: json["id"],
        price: json["price_sale"],
        name: json["name"],
        image: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price_sale": price,
        "name": name,
        "thumb": image,
      };
}
