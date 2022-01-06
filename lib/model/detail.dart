import 'dart:convert';

DetailModel detailModelFromJson(String str) =>
    DetailModel.fromJson(json.decode(str));

String detailModelToJson(DetailModel data) => json.encode(data.toJson());

class DetailModel {
  // List<String> bannerList;
  // List<SpecificationList> specificationList;
  // String contact;
  String name;
  // String brandName;
  // String goodsSeries;
  int price;
  // String supplierId;
  // String supplierName;
  // String supplierCode;
  // String platformCode;
  // String produceTime;
  // String guidePrice;
  // String miniBuyNum;
  String image;

  DetailModel({
    // required this.bannerList,
    // required this.specificationList,
    // required this.contact,
    required this.name,
    // required this.brandName,
    // required this.goodsSeries,
    required this.price,
    // required this.supplierId,
    // required this.supplierName,
    // required this.supplierCode,
    // required this.platformCode,
    // required this.produceTime,
    // required this.guidePrice,
    // required this.miniBuyNum,
    required this.image,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        // bannerList: List<String>.from(json["bannerList"].map((x) => x)),
        // specificationList: List<SpecificationList>.from(
        //     json["specificationList"]
        //         .map((x) => SpecificationList.fromJson(x))),
        // contact: json["contact"],
        name: json["name"],
        // brandName: json["brandName"],
        // goodsSeries: json["goodsSeries"],
        price: json["price_sale"],
        // supplierId: json["supplierId"],
        // supplierName: json["supplierName"],
        // supplierCode: json["supplierCode"],
        // platformCode: json["platformCode"],
        // produceTime: json["produceTime"],
        // guidePrice: json["guidePrice"],
        // miniBuyNum: json["miniBuyNum"],
        image: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        // "bannerList": List<dynamic>.from(bannerList.map((x) => x)),
        // "specificationList":
        //     List<dynamic>.from(specificationList.map((x) => x.toJson())),
        // "contact": contact,
        "name": name,
        // "brandName": brandName,
        // "goodsSeries": goodsSeries,
        "price_sale": price,
        // "supplierId": supplierId,
        // "supplierName": supplierName,
        // "supplierCode": supplierCode,
        // "platformCode": platformCode,
        // "produceTime": produceTime,
        // "guidePrice": guidePrice,
        // "miniBuyNum": miniBuyNum,
        "thumb": image,
      };
}

class SpecificationList {
  String name;
  List<String> specification;

  SpecificationList({
    required this.name,
    required this.specification,
  });

  factory SpecificationList.fromJson(Map<String, dynamic> json) =>
      SpecificationList(
        name: json["name"],
        specification: List<String>.from(json["specification"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "specification": List<dynamic>.from(specification.map((x) => x)),
      };
}
