import 'package:fashion/components/components.dart';
import 'package:fashion/pages/shopping_cart/store/shopping_cart_provider.dart';
import 'package:fashion/styles/colors.dart';
import 'package:fashion/utils/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'components/cart_bottom.dart';
import 'components/cart_item.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _provider = ShopingCartProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _provider,
      child: BaseScaffold(
        title: 'Shopping Cart',
        actions: <Widget>[
          Selector<ShopingCartProvider, Tuple2<Function, bool>>(
            builder: (_, tuple, __) {
              return IconButton(
                iconSize: 33.0,
                icon: Text(
                  tuple.item2 ? 'Save' : 'Edit',
                  style: TextStyle(
                      color: AppColors.primaryGreyText,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () => tuple.item1(),
              );
            },
            selector: (_, provider) =>
                Tuple2(provider.changeEditMode, provider.isEditMode),
          ),
        ],
        body: CartContainer(),
      ),
    );
  }
}

class CartContainer extends StatelessWidget {
  const CartContainer({Key? key}) : super(key: key);
  Widget _listItemBuilder(BuildContext context, int index) {
    // Take out the data
    final brandList = Provider.of<ShopingCartProvider>(context).getBrandList;
    return Container(
      color: Color(0xFFF5F7F7),
      padding: EdgeInsets.all(10.0),
      child: CartItem(brandData: brandList[index], brandIndex: index),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Take out the data
    final brandList = Provider.of<ShopingCartProvider>(context).getBrandList;
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 80.0),
          color: Color(0xFFF5F7F7),
          child: brandList.length == 0 || brandList.first.brandList.isEmpty
              ? Empty(
                  img: 'assets/images/shopping_cart/empty.png',
                  tipText: 'The shopping cart is empty, go shopping',
                  buttonText: 'Go to purchase',
                  buttonTap: () => MyNavigator.popToHome(),
                )
              : ListView.builder(
                  itemCount: brandList.length,
                  itemBuilder: _listItemBuilder,
                ),
        ),
        CartBottom(),
      ],
    );
  }
}
