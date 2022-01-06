import 'package:fashion/components/my_cahenetwork_image.dart';
import 'package:fashion/config/config.dart';
import 'package:fashion/model/goods.dart';
import 'package:fashion/pages/detail/detail_page.dart';
import 'package:fashion/styles/styles.dart';
import 'package:fashion/utils/my_navigator.dart';
import 'package:flutter/material.dart';

class CommdityItemHome extends StatelessWidget {
  final GoodsList goodData;
  const CommdityItemHome({Key? key, required this.goodData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => MyNavigator.push(DetailPage(goodsId: goodData.id)),
      child: Container(
        width: (MediaQuery.of(context).size.width - 40) / 2,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 3/4,
              child: MyCachedNetworkImage(
                imageurl: SERVER_HOST_IMG + goodData.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: (MediaQuery.of(context).size.width - 40) / 2,
                child: Text(
                  goodData.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // Container(
            //   width: (MediaQuery.of(context).size.width - 40) / 2,
            //   child: Text(
            //     'Uniqlo official flagship store',
            //     maxLines: 1,
            //     overflow: TextOverflow.ellipsis,
            //     style: TextStyle(
            //       color: AppColors.primaryGreyText,
            //       fontSize: 12.0,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: (MediaQuery.of(context).size.width - 40) / 2,
                child: Text(
                  '${goodData.price} đ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.priceColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
