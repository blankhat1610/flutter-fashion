import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion/components/components.dart';
import 'package:fashion/pages/order_detail/order_detail_page.dart';
import 'package:fashion/pages/pay/pay_page.dart';
import 'package:fashion/pages/supplier/supplier_page.dart';
import 'package:fashion/styles/colors.dart';
import 'package:fashion/utils/my_navigator.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final orderItemData;
  const OrderItem({Key? key, this.orderItemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
              Head(), // head
            ] +
            [1, 2, 3].map<Widget>((item) {
              return Content();
            }).toList() +
            [Bottom()],
      ),
    );
  }
}

///Top supplier
class Head extends StatelessWidget {
  const Head({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => MyNavigator.push(SupplierPage(supplierId: "supplierId")),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'MUJI',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF121212),
                  ),
                ),
                SizedBox(width: 10.5),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFF4A4A4A),
                  size: 20.0,
                ),
              ],
            ),
            Text(
              'Pending payment',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4A4A4A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Order content
class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MyNavigator.push(OrderDetailPage(orderId: "id")),
      child: Container(
        height: 120.0,
        margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
        decoration: BoxDecoration(
          color: Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 15,
              top: 15,
              child: Container(
                // color: Colors.red,
                child: CachedNetworkImage(
                  placeholder: (_, __) =>
                      Image.asset('assets/images/order/jiazaizhong.png'),
                  imageUrl:
                      'https://yanxuan.nosdn.127.net/dd9cd8d2dae44d4319ab21919021435b.png',
                  height: 90,
                  width: 90,
                ),
              ),
            ),
            Positioned(
              left: 125,
              right: 15,
              top: 16,
              child: Text(
                "Living room bedroom single sofa recliner simple leisure tatami creative Japanese fabric small sofa",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF17191A)),
              ),
            ),
            Positioned(
              left: 125,
              top: 40,
              right: 15,
              child: Text(
                'Warm gray single sofa comfortable 90*110cm',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFAAB0B3)),
              ),
            ),
            Positioned(
              // price
              left: 125,
              top: 81.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Price',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Positioned(
              // price
              left: 175,
              top: 81.0,
              child: RichText(
                text: TextSpan(
                    text: '￥',
                    style: TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '2348',
                        style: TextStyle(
                          color: Color(0xFF121212),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]),
              ),
            ),
            Positioned(
              // price
              right: 20,
              top: 81.0,
              child: Text(
                'x2',
                style: TextStyle(
                  color: Color(0xFF17191A),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// bottom
class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);
  // pop-up dialogue box
  void _showCancelDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CustomDialog(
            title: '',
            content: Center(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/order/querendingdan.png'),
                  Container(
                    padding: EdgeInsets.only(bottom: 0.0, top: 20),
                    child: Text(
                      'Cancel order',
                      style:
                          TextStyle(color: Color(0xFF4A4A4A), fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            confirmContent: 'OK',
            cancelContent: 'Return',
            isCancel: true,
            // confirmColor: Color(0xFFF5A623),
            confirmCallback: () {
              /// Cancel order operation
            },
            dismissCallback: () {
              return;
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      // color: Colors.red,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: 'Total',
                    style: TextStyle(
                      color: Color(0xFF4A4A4A),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '1',
                        style: TextStyle(
                          color: Color(0xFFB80821),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'items',
                        style: TextStyle(
                          color: Color(0xFF4A4A4A),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ]),
              ),
              RichText(
                text: TextSpan(
                    text: 'Total:',
                    style: TextStyle(
                      color: Color(0xFF4A4A4A),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '￥2988',
                        style: TextStyle(
                          color: AppColors.priceColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                OutlineButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  onPressed: () {},
                  highlightElevation: 5.0,
                  splashColor: AppColors.splashColor,
                  child: Center(
                    child: Text(
                      'Customer service',
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                OutlineButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  onPressed: () => _showCancelDialog(context),
                  splashColor: AppColors.splashColor,
                  highlightElevation: 5.0,
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    onPressed: () => MyNavigator.push(PayPage(orderId: "id")),
                    color: AppColors.primaryColor,
                    child: Center(
                      child: Text(
                        'Pay',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
