import 'package:fashion/components/my_divider.dart';
import 'package:fashion/styles/colors.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String goodsName;
  final String brandName;
  final String goodsSeries;
  final String price;
  const Info(
      {Key? key,
      required this.goodsName,
      required this.brandName,
      required this.goodsSeries,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 125,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        child: Row(
          children: <Widget>[
            /// left
            Container(
              width: MediaQuery.of(context).size.width - 136,
              // color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    goodsName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Brand: $brandName ',
                    style: TextStyle(
                      color: AppColors.primaryGreyText,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'Series: $goodsSeries ',
                    style: TextStyle(
                      color: AppColors.primaryGreyText,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            MyVerticalDivider(),

            /// right
            Container(
              width: 105,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 7),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Preferential price',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                        text: '￥',
                        style: TextStyle(
                          color: AppColors.priceColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '$price',
                            style: TextStyle(
                              color: AppColors.priceColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
