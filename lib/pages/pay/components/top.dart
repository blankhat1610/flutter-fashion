import 'package:fashion/styles/colors.dart';
import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 224,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: Center(
              child: Text(
                'Order amount',
                style: TextStyle(
                  color: Color(0xFF17191A),
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0, bottom: 30),
            child: Center(
              child: Text(
                '￥15900',
                style: TextStyle(
                  color: AppColors.priceColor,
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Payment method',
              style: TextStyle(
                color: Color(0xFF4A4A4A),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 15),
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFFFEF6F4),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.priceColor),
            ),
            child: Center(
              child: Text(
                'Pay in full',
                style: TextStyle(
                  color: AppColors.priceColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
