import 'package:fashion/components/components.dart';
import 'package:fashion/config/config.dart';
import 'package:fashion/pages/detail/components/Introduction_configuration.dart';
import 'package:fashion/pages/detail/store/detail_page_provider.dart';
import 'package:fashion/styles/colors.dart';
import 'package:fashion/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/bottom.dart';
import 'components/head_swiper.dart';
import 'components/info.dart';
import 'components/specifications.dart';

class DetailPage extends StatelessWidget {
  final int goodsId;
  const DetailPage({Key? key, required this.goodsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailPageProvider(this.goodsId),
      child: BaseScaffold(
        leadType: AppBarBackType.Back,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/home/fenxiang.png',
              width: duSetWidth(25),
              height: duSetHeight(23.5),
            ),
            onPressed: () {},
          ),
        ],
        title: 'Product Details',
        body: DetailContainer(),
      ),
    );
  }
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<DetailPageProvider>(context);
    //////
    return state.loading
        ? MyLoadingWidget()
        : Container(
            color: AppColors.primaryBackground,
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
                        AspectRatio(
                          aspectRatio: 3/4,
                          child: MyCachedNetworkImage(
                            imageurl: SERVER_HOST_IMG + state.image,
                          ),
                        ),
                        MyDivider(),
                        Info(
                          name: state.name,
                          // brandName: state.brandName,
                          // goodsSeries: state.goodsSeries,
                          price: state.price,
                        ),
                        MyDivider(),
                        // Specifications(
                        //     price: state.price,
                        //     goodsImgUrl: state.image,
                        //     guidePrice: state.guidePrice,
                        //     miniBuyNum: state.miniBuyNum,
                        //     specificationList: state.specificationList
                        // ),
                        IntroductionAndConfiguration()
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: DetailBottom(),
                ),
              ],
            ),
          );
  }
}
