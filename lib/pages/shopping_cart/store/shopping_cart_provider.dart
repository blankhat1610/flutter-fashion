import 'dart:async';

import 'package:fashion/components/my_toast.dart';
import 'package:flutter/foundation.dart';

class ShopingCartProvider with ChangeNotifier {
  /// Whether to select all products
  bool _isSelectAllGood = false;

  /// The number of selected products
  int _goodTotalNum = 0;

  /// The total price of the selected goods
  int _goodTotalPrice = 0;

  /// Is it in edit mode
  bool isEditMode = false;

  ShopingCartProvider() {
    changeBrandState();
    changeBottomState();
  }

  /// Brand list
  List<BrandItem> _brandList = [
    BrandItem(
      brandName: 'UNIQLO',
      brandCompany: 'Uniqlo Clothing Co. , Ltd.',
      brandSendByself: true,
      brandSendBySend: true,
      isBrandChecked: false,
      brandList: [
        GoodItem(
          goodIsChecked: false,
          good: getOneGood1(),
          count: 1,
        ),
        GoodItem(
          goodIsChecked: true,
          good: getOneGood1(),
          count: 1,
        ),
        GoodItem(
          goodIsChecked: false,
          good: getOneGood1(),
          count: 1,
        ),
      ],
    ),
    BrandItem(
      brandName: 'MUJI',
      brandCompany: 'MUJI Trading Co. , Ltd.',
      brandSendByself: false,
      brandSendBySend: true,
      isBrandChecked: false,
      brandList: [
        GoodItem(
          goodIsChecked: true,
          good: getOneGood2(),
          count: 1,
        ),
        GoodItem(
          goodIsChecked: false,
          good: getOneGood2(),
          count: 1,
        ),
      ],
    ),
  ];

  /// Get _brandList
  List<BrandItem> get getBrandList => this._brandList;

  /// Get _isSelectAllGood
  bool get isSelectAllGood => this._isSelectAllGood;

  int get goodTotalNum => this._goodTotalNum;

  int get goodTotalPrice => this._goodTotalPrice;

  /*
   * @item GoodItem
   * Choose a single product,
   * First change the state of GoodItem itself,
   * Change the state of the parent BrandItem again,
   * Then change the status of the bottom bottom
   */
  void selectSingleGood(GoodItem item) {
    item.goodIsChecked = !item.goodIsChecked; // change its own state
    Future.microtask(() {
      changeBrandState(); // Change the state of the parent BrandItem
      changeBottomState(); // Change the state of the bottom bottom
    });
  }

  /*
   * @index BrandItem
   * Select all the products under a BrandItem
   * First change the status of your BrandItem
   * Change the status of all products under BrandItem
   * Then change the status of the bottom bottom
   */
  void selectBrandAllGood(int index) {
    this._brandList[index].isBrandChecked =
        !this._brandList[index].isBrandChecked; // change its own state
    this._brandList[index].brandList.forEach((item) => item.goodIsChecked = this
        ._brandList[index]
        .isBrandChecked); // Change the status of all products under BrandItem
    Future.microtask(() {
      changeBottomState(); // Change the state of the bottom bottom
    });
  }

  /*
   * When a single item is selected, the state of the item is changed, and then the state of the parent BrandItem is changed
   */
  changeBrandState() {
    this._brandList.forEach((item) => {
          item.isBrandChecked = item.brandList.any((item) => item.goodIsChecked)
        });
  }

  /*
   * When a single item is selected, the state of the bottom bottom will be changed after the state of the item is changed
   */
  void changeBottomState() {
    this._isSelectAllGood = this.getBrandList.every((item) {
      return item.brandList.every((item) => item.goodIsChecked);
    });
    this._goodTotalNum = 0;
    this._goodTotalPrice = 0;
    this._brandList.forEach((brandItem) => brandItem.brandList.forEach((item) {
          if (item.goodIsChecked) {
            this._goodTotalNum += item.count;
            this._goodTotalPrice += item.getTotalMoney();
          }
        }));
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /*
   * Click the select all button at the bottom bottom
   * Change the status of oneself _isSelectAllGood first
   * Change the status of each brandItem and the status of each product below
   */
  void selectAllGood() {
    this._isSelectAllGood =
        !this._isSelectAllGood; // Change the state of _isSelectAllGood
    this._brandList.forEach((item) {
      item.isBrandChecked =
          this._isSelectAllGood; // Change the status of each brandItem
      item.brandList.forEach((item) => item.goodIsChecked = this
          ._isSelectAllGood); // Then change the status of each product under each brandItem
    });
    Future.microtask(() {
      changeBottomState(); // Change the state of the bottom bottom
    });
  }

  void addOneGoodItem(GoodItem item, int value) {
    item.count += value;
    if (item.count < 1) {
      item.count = 1;
      MyToast.show('The quantity of goods has reached the minimum');
      return;
    }
    item.goodIsChecked = true;
    notifyListeners();

    Future.microtask(() {
      changeBrandState(); // Change the state of the parent BrandItem
      changeBottomState(); // Change the state of the bottom bottom
    });
  }

  void changeEditMode() {
    this.isEditMode = !this.isEditMode;
    notifyListeners();
  }

  void deteleGood() {
    this._brandList.forEach((brandItem) {
      brandItem.isBrandChecked = false;
      for (var i = brandItem.brandList.length - 1; i >= 0; i--) {
        if (brandItem.brandList[i].goodIsChecked) {
          brandItem.brandList.removeAt(i);
        }
      }
    });
    for (var i = this._brandList.length - 1; i >= 0; i--) {
      if (this._brandList[i].brandList.length == 0) {
        this._brandList.removeAt(i);
      }
    }
    Future.microtask(() {
      changeBottomState(); // Change the state of the bottom bottom
    });
  }
}

/// Brand Model
class BrandItem {
  String brandName;
  String brandCompany;
  bool brandSendByself;
  bool brandSendBySend;
  bool isBrandChecked = false;
  List<GoodItem> brandList;

  BrandItem({
    required this.brandName,
    required this.brandCompany,
    required this.brandSendByself,
    required this.brandSendBySend,
    required this.brandList,
    required this.isBrandChecked,
  });

  /// Calculate the total price of each group of brands
  int getTotalMoney() {
    int total = 0;
    for (GoodItem item in this.brandList) {
      total += item.getTotalMoney();
    }
    return total;
  }

  /*
   * Determine whether the sub-products under the brand are selected,
   * If checked, the @isBrandChecked parameter of the brand should be true
   * */
  bool get isSomeOneGoodSelected {
    bool isSomeOneGoodSelected = false;
    for (GoodItem item in this.brandList) {
      if (item.goodIsChecked) {
        isSomeOneGoodSelected = true;
        break;
      }
    }
    return isSomeOneGoodSelected;
  }
}

/// Commodity Model
class GoodItem {
  Good good;
  bool goodIsChecked = false;
  int count = 1; // the number of commodities
  GoodItem(
      {required this.good, required this.goodIsChecked, required this.count});

  /// Calculate the total price of the current single item
  int getTotalMoney() {
    return count * this.good.price;
  }

  /// Determine whether the quantity exceeds the inventory
  bool get isBiggerQuantity {
    return this.count < this.good.stockQuantity;
  }
}

/// Details of each product
class Good {
  const Good({
    /** Commodity brand id */
    required this.goodsBrandId,
    /** Commodity brand type*/
    required this.goodsBrandName,
    /** Commodity brand type description*/
    required this.goodsBrandCompany,
    /** Commodity id */
    required this.goodsId,
    /** product name*/
    required this.goodsName,
    /** product description*/
    required this.goodsDescription,
    /** The map's address*/
    required this.imageUrl,
    /** Minimum purchase amount*/
    required this.minBuyCount,
    /** Inventory quantity*/
    required this.stockQuantity,
    /** price*/
    required this.price,
  });

  final String goodsBrandId;
  final String goodsBrandName;
  final String goodsBrandCompany;
  final String goodsId;
  final String goodsName;
  final String goodsDescription;
  final String imageUrl;
  final String minBuyCount;
  final int stockQuantity;
  final int price;
}

/// Create data
Good getOneGood1() {
  return Good(
    goodsBrandId: 'goodsBrandId1',
    goodsBrandName: '优 衣 库',
    goodsBrandCompany: 'Beijing Zongshen Trading Company',
    goodsId: 'goodsId1',
    goodsName: 'Men\'s stretch wool slim jacket (suit) 419434',
    goodsDescription:
        '1033 Khaki-XL size for spring and autumn models (suitable for 120-140 kg)',
    imageUrl:
        'https://yanxuan.nosdn.127.net/1f44908a54d0a855d376d599372738d4.png',
    minBuyCount: '1',
    stockQuantity: 23,
    price: 2684,
  );
}

/// Create data
Good getOneGood2() {
  return Good(
    goodsBrandId: 'goodsBrandId2',
    goodsBrandName: 'ZARA',
    goodsBrandCompany: 'Chongqing Zongshen Trading Company',
    goodsId: 'goodsId2',
    goodsName:
        'Fully automatic outdoor tent rainproof outdoor double double-layer tent set for 3-4 people free of construction',
    goodsDescription:
        'The explorer (TAN XIAN ZHE) dark green dual-use gift package worth 200 yuan',
    imageUrl:
        'https://yanxuan.nosdn.127.net/a15c33fdefe11388b6f4ed5280919fdd.png',
    minBuyCount: '1',
    stockQuantity: 555,
    price: 2311,
  );
}
