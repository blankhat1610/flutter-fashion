import 'package:fashion/components/my_cahenetwork_image.dart';
import 'package:fashion/model/goods.dart';
import 'package:fashion/pages/detail/detail_page.dart';
import 'package:fashion/styles/colors.dart';
import 'package:fashion/utils/my_navigator.dart';
import 'package:flutter/material.dart';

class CommdityItem extends StatelessWidget {
  final GoodsList goodData;

  const CommdityItem({Key? key, required this.goodData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => MyNavigator.push(DetailPage(goodsId: goodData.id)),
      child: Container(
        height: 140,
        // color: Colors.red,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 10,
              top: 4.5,
              width: 120,
              height: 130,
              child: MyCachedNetworkImage(
                imageurl: goodData.image,
              ),
            ),
            Positioned(
              left: 149.0,
              top: 10,
              child: Container(
                width: MediaQuery.of(context).size.width - 210.0,
                child: Text(
                  goodData.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 149.0,
              top: 57,
              child: Text(
                'Uniqlo official flagship store',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Positioned(
              left: 149.0,
              top: 83.5,
              child: Container(
                width: MediaQuery.of(context).size.width - 210.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Guide retail price',
                      style: TextStyle(
                        color: AppColors.primaryGreyText,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      goodData.price.toString(),
                      style: TextStyle(
                        color: AppColors.primaryGreyText,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 149.0,
              top: 105,
              child: Container(
                width: MediaQuery.of(context).size.width - 210.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Purchase Price',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'đ' + goodData.price.toString(),
                      style: TextStyle(
                        color: AppColors.priceColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
