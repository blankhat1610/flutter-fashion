import 'package:fashion/components/components.dart';
import 'package:fashion/pages/shopping_cart/store/shopping_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:provider/provider.dart';

import 'components/bottom.dart';
import 'components/order_item.dart';
import 'components/top.dart';

class ConfirmOrderPageBuyNow extends StatelessWidget {
  final BrandItem brandItem;

  const ConfirmOrderPageBuyNow({Key? key, required this.brandItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.Back,
      title: 'Confirm order',
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ConfirmOrderPageContainerBuyNow(
          brandItem: brandItem,
        ),
      ),
    );
  }
}

class ConfirmOrderPageContainerBuyNow extends StatelessWidget {
  final BrandItem brandItem;

  const ConfirmOrderPageContainerBuyNow({Key? key, required this.brandItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7F7F7),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(
                bottom: 70 + MediaQuery.of(context).padding.bottom),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Top(),
                  _buildOrderList(context, orderList: [brandItem]),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Bottom(good: brandItem.brandList.first.good),
          ),
        ],
      ),
    );
  }

  /// Order List
  Widget _buildOrderList(BuildContext context,
      {required List<BrandItem> orderList}) {
    // final brandList = Provider.of<ShopingCartProvider>(context).getBrandList;
    // print(brandList);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: orderList.first.brandList.map((item) {
          return OrderItem(
            null,
            brandItem: item,
          );
        }).toList(),
      ),
    );
  }
}
