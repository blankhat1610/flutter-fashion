import 'package:fashion/components/components.dart';
import 'package:fashion/config/config.dart';
import 'package:fashion/pages/confirm_order/confirm_order.dart';
import 'package:fashion/pages/confirm_order/confirm_order_buynow.dart';
import 'package:fashion/pages/detail/store/detail_page_provider.dart';
import 'package:fashion/pages/shopping_cart/cart_page.dart';
import 'package:fashion/pages/shopping_cart/store/shopping_cart_provider.dart';
import 'package:fashion/services/cart.dart';
import 'package:fashion/styles/colors.dart';
import 'package:fashion/utils/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailBottom extends StatelessWidget {
  // final String contact;
  const DetailBottom({Key? key}) : super(key: key);

  /// each item on the left
  Widget _buildleftItem(String imgUrl, String title) {
    return Column(
      children: <Widget>[
        Image.asset(
          imgUrl,
          width: 25.0,
          height: 25.0,
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xFF9B9B9B),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }

  /// right
  Widget _buildRight(DetailPageProvider state) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () async {
            CartApi.addToCart(state.goodsId, 1, int.parse(state.price));
            MyToast.show('Successfully added to the shopping cart');
          },
          child: Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
              // color: AppColors.addToCart,
              gradient: LinearGradient(
                //Background radial gradient
                colors: [AppColors.addToCart1, AppColors.addToCart2],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
            ),
            child: Center(
              child: Text(
                'Add to cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            MyNavigator.push(ConfirmOrderPageBuyNow(
                brandItem: BrandItem(
                    brandName: '',
                    brandSendByself: false,
                    brandSendBySend: false,
                    isBrandChecked: true,
                    brandCompany: 'MXT',
                    brandList: [
                  GoodItem(
                      good: Good(
                          goodsBrandCompany: 'MXT',
                          goodsBrandId: "MXT",
                          goodsBrandName: 'MXT',
                          goodsDescription: '',
                          goodsId: state.goodsId.toString(),
                          goodsName: state.name,
                          imageUrl: SERVER_HOST_IMG + state.image,
                          minBuyCount: '',
                          price: int.parse(state.price),
                          stockQuantity: 300),
                      goodIsChecked: true,
                      count: 1)
                ])));
          },
          child: Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                //Background radial gradient
                colors: [AppColors.buyNow1, AppColors.buyNow2],
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Center(
              child: Text(
                'Buy now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  // void _contact() async {
  //   final url = 'tel:' + contact;
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   }
  // }

  // pop-up dialogue box
  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CustomDialog(
            title: 'Contact customer service',
            titleStyle: TextStyle(
              color: Color(0xFF121212),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            content: Center(
              child: Column(
                children: <Widget>[
                  // Container(
                  //   padding: EdgeInsets.only(bottom: 10.0),
                  //   child: Text(
                  //     'Contact phone: $contact ',
                  //     style:
                  //         TextStyle(color: Color(0xFF666666), fontSize: 14.0),
                  //   ),
                  // ),
                  Container(
                    child: Text(
                      'Customer service working hours: working days 9:30~17:30',
                      style:
                          TextStyle(color: Color(0xFF666666), fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            confirmContent: 'make a call',
            isCancel: true,
            confirmTextColor: AppColors.buyNow1,
            // confirmCallback: () {
            //   _contact();
            // },
            dismissCallback: () {
              return;
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<DetailPageProvider>(context);
    return Container(
      height: 60 + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom, top: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: Color(0xffdfdfdf),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // GestureDetector(
                //     onTap: () => _showDialog(context),
                //     child:
                //         _buildleftItem('assets/images/home/lianxi.png', '客服')),
                // SizedBox(
                //   width: 30,
                // ),
                // GestureDetector(
                //     onTap: () =>
                //         MyNavigator.push(SupplierPage(supplierId: 'id')),
                //     child: _buildleftItem('assets/images/home/shop.png', '店铺')),
                // SizedBox(
                //   width: 30,
                // ),
                GestureDetector(
                    onTap: () => MyNavigator.push(CartPage()),
                    child: _buildleftItem(
                        'assets/images/home/gouwuche.png', 'Cart')),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _buildRight(state),
          ),
        ],
      ),
    );
  }
}
