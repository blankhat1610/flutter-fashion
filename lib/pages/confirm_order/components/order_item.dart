import 'package:AiRi/components/components.dart';
import 'package:AiRi/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AiRi/pages/confirm_order/components/remark.dart';
import 'package:AiRi/pages/shopping_cart/components/cart_item.dart';
import 'package:AiRi/pages/shopping_cart/store/shopping_cart_provider.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 1),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildSupplierName(),
          _buildGoodsBanner(context),
          _buildInfo(),
          Remark(),
        ],
      ),
    );
  }

  /// Supplier name
  Widget _buildSupplierName() {
    return Text(
      'Uniqlo',
      style: TextStyle(
        color: Color(0xFF121212),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// Commodity banner
  Widget _buildGoodsBanner(BuildContext context) {
    /// Number of products
    List goodsList = [1, 1, 1, 1];
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 18),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 30,
      color: Color(0xFFF7F7F7),
      child: Wrap(
        spacing: 10.0,
        alignment: WrapAlignment.start,
        children: goodsList.map<Widget>((item) {
              return _buildGoodsBannerItem(
                  "https://yanxuan.nosdn.127.net/3d70af62c5461e795644b12721508372.png");
            }).toList() +
            [_buildGoodTotalNum(context, goodsList.length)],
      ),
    );
  }

  /// Commodity banner Item
  Widget _buildGoodsBannerItem(String imgUrl) {
    return Container(
      width: 60,
      height: 60,
      child: MyCachedNetworkImage(imageurl: imgUrl),
    );
  }

  /// amount of goods
  Widget _buildGoodTotalNum(BuildContext context, int num) {
    return GestureDetector(
      onTap: () => openDialog(context),
      child: Container(
        height: 60,
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              '...',
              style: TextStyle(
                color: Color(0xFFB80821),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'Total $num pieces',
              style: TextStyle(
                color: Color(0xFF121212),
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Payment method and total price
  Widget _buildInfo() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
                text: 'Payment method:',
                style: TextStyle(
                  color: Color(0xFF9B9B9B),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Full payment',
                    style: TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ]),
          ),
          RichText(
            text: TextSpan(
                text: 'Total price',
                style: TextStyle(
                  color: Color(0xFF9B9B9B),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '???15900',
                    style: TextStyle(
                      color: AppColors.priceColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }

  /// Open the dialog box to select specifications
  void openDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        builder: (BuildContext context) {
          return _buildDialog(context);
        });
  }

  /// Dialog
  Widget _buildDialog(BuildContext context) {
    /// The dialog box does not belong to the wdiget tree, it must be re-wrapped with the provider here
    return ChangeNotifierProvider(
      create: (_) => ShopingCartProvider(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 30,
                  child: Icon(
                    Icons.close,
                    color: Color(0xFF000000),
                    size: 24.0,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75 -
                    30 -
                    MediaQuery.of(context).padding.bottom,
                width: MediaQuery.of(context).size.width - 20,
                child: ListView.builder(
                  itemBuilder: _listItemBuilder,
                  itemCount: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build each item of the dialog
  Widget _listItemBuilder(BuildContext context, int index) {
    // Take out the data
    final brandList = Provider.of<ShopingCartProvider>(context).getBrandList;
    return Container(
      child: CartItem(
        brandData: brandList[0],
        brandIndex: 0,
        isShowCheckButton: false,
      ),
    );
  }
}
