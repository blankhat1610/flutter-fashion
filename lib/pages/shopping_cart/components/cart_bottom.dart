import 'package:fashion/components/components.dart';
import 'package:fashion/pages/confirm_order/confirm_order.dart';
import 'package:fashion/pages/home/home_page.dart';
import 'package:fashion/pages/shopping_cart/store/shopping_cart_provider.dart';
import 'package:fashion/styles/styles.dart';
import 'package:fashion/utils/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomHeight =
        MediaQuery.of(context).padding.bottom; // Get the safety distance
    // Take out method
    final selectAllGood =
        Provider.of<ShopingCartProvider>(context, listen: false).selectAllGood;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        // color: Colors.white,
        padding: EdgeInsets.only(bottom: bottomHeight),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xFFE8EAEB),
              width: 1.0,
            ),
          ),
        ),
        height: 60.0 + bottomHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Selector<ShopingCartProvider, bool>(
                    selector: (_, shopingCartProvider) =>
                        shopingCartProvider.isSelectAllGood,
                    builder: (_, isSelectAllGood, __) {
                      return GestureDetector(
                        onTap: () => selectAllGood(),
                        child: isSelectAllGood
                            ? Image.asset(
                                'assets/images/shopping_cart/check.png',
                                width: 24.0,
                                height: 24.0,
                              )
                            : Image.asset(
                                'assets/images/shopping_cart/bottom_check.png',
                                width: 24.0,
                                height: 24.0,
                              ),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: selectAllGood,
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Select all',
                            style: TextStyle(
                              color: Color(0xFF18191A),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Selector<ShopingCartProvider, int>(
                            selector: (_, shopingCartProvider) =>
                                shopingCartProvider.goodTotalNum,
                            builder: (_, goodTotalNum, __) {
                              return Text(
                                'Quantity $goodTotalNum ',
                                style: TextStyle(
                                  color: Color(0xFF979899),
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Selector<ShopingCartProvider, Tuple3<bool, int, Function>>(
              selector: (_, shoppingCartProvider) => Tuple3(
                  shoppingCartProvider.isEditMode,
                  shoppingCartProvider.goodTotalNum,
                  shoppingCartProvider.deteleGood),
              builder: (_, tuple, __) {
                return tuple.item1
                    ? Container(
                        padding: EdgeInsets.only(right: 10.0),
                        child: OutlineButton(
                          child: Text(
                            'Delete(' + tuple.item2.toString() + ')',
                            style: TextStyle(
                              color: Color(0xFF17191A),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onPressed: () => tuple.item3(),
                        ),
                      )
                    : Row(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(right: 7.5),
                              child: Selector<ShopingCartProvider, int>(
                                selector: (_, shopingCartProvider) =>
                                    shopingCartProvider.goodTotalPrice,
                                builder: (_, goodTotalPrice, __) {
                                  return Text(
                                    '$goodTotalPrice đ',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.priceColor,
                                    ),
                                  );
                                },
                              )),
                          Consumer<ShopingCartProvider>(
                              builder: (context, value, child) {
                            return GestureDetector(
                              onTap: () {
                                if (value.getBrandList.isEmpty ||
                                    value
                                        .getBrandList.first.brandList.isEmpty) {
                                  _showDialog(context);
                                } else
                                  MyNavigator.push(ConfirmOrderPage());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    //Background radial gradient
                                    colors: [
                                      AppColors.buttonLine1,
                                      AppColors.buttonLine2
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(1.0),
                                ),
                                width: 120.0,
                                height: 60.0,
                                child: Center(
                                  child: Text(
                                    'Place an order',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ),
                            );
                          })
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  // pop-up dialogue box
  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CustomDialog(
            title: 'Alert Dialog',
            titleStyle: TextStyle(
              color: Color(0xFF121212),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            content: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Your cart is not have anything, go shop ping please!',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Color(0xFF666666), fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
            confirmContent: 'Go Shopping',
            isCancel: true,
            confirmTextColor: AppColors.buyNow1,
            confirmCallback: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => new HomePage(),
              ));
            },
            dismissCallback: () {
              return;
            },
          );
        });
  }
}
