import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:AiRi/components/base_scaffold.dart';
import 'package:AiRi/components/commdity_item.dart';
import 'package:AiRi/components/left_title.dart';
import 'package:AiRi/components/my_app_bar.dart';
import 'package:AiRi/components/my_custom_footer.dart';
import 'package:AiRi/components/my_divider.dart';
import 'package:AiRi/components/my_loading.dart';
import 'package:AiRi/model/goods.dart';
import 'package:AiRi/pages/search/search_page.dart';
import 'package:AiRi/pages/supplier/components/search_bar.dart';
import 'package:AiRi/pages/supplier/store/supplier_provider.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:AiRi/utils/my_navigator.dart';

class SupplierPage extends StatelessWidget {
  final String supplierId;
  const SupplierPage({Key? key, required this.supplierId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SupplierPageProvider(),
      child: BaseScaffold(
        appBar: MyAppBar(
          brightness: Brightness.dark,
          leadingType: AppBarBackType.Back,
          leading: AppBarBack(AppBarBackType.Back, color: Colors.white),
          backgroundColor: AppColors.supplierColor1,
          centerTitle: true,
          title: MyTitle('优衣库', color: Colors.white),
        ),
        body: SupplierContainer(),
      ),
    );
  }
}

class SupplierContainer extends StatelessWidget {
  const SupplierContainer({Key? key}) : super(key: key);

  /// Above
  Widget _buildTop(
    BuildContext context,
    TextStyle infoTextStyle, {
    required String supplierName,
    required String contact,
    required String phoneNum,
    required String workTime,
    required String address,
  }) {
    return SliverToBoxAdapter(
      child: Stack(
        children: <Widget>[
          Container(
            height: 211,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                //Background radial gradient
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.supplierColor1, AppColors.supplierColor2],
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: <Widget>[
                  SearchBar(
                      myOntap: (value) => MyNavigator.push(SearchPage(
                            title: 'Search',
                            key: value,
                            keyword: '',
                          ))),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          child: Text(
                            supplierName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/supplier/lianxiren.png',
                          width: 15,
                          height: 15,
                        ),
                        SizedBox(width: 10),
                        Text(contact, style: infoTextStyle),
                        SizedBox(width: 15),
                        Text(phoneNum, style: infoTextStyle),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/supplier/shijian.png',
                          width: 15,
                          height: 15,
                        ),
                        SizedBox(width: 10),
                        Text('Business Hours', style: infoTextStyle),
                        SizedBox(width: 15),
                        Text(workTime, style: infoTextStyle),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/supplier/weizi.png',
                          width: 15,
                          height: 15,
                        ),
                        SizedBox(width: 10),
                        Text(address, style: infoTextStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// The bottom rounded corner effect
          Positioned(
            top: 206,
            left: 0,
            child: Container(
              height: 16,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Business introduction below
  Widget _buildBottomInfo(BuildContext context,
      {required String supplierImgUrl, required String introDuceText}) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 22.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: <Widget>[
            LeftTitle(
              tipColor: AppColors.primaryColor,
              title: 'Introduction',
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 145,
              width: MediaQuery.of(context).size.width - 60,
              child: CachedNetworkImage(
                imageUrl:
                    supplierImgUrl, // If there is no picture, there should be a default picture
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                introDuceText,
                style: TextStyle(
                  color: Color(0xFF9B9B9B),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Product list below
  List<Widget> _bottomList({required List<GoodsList> supplierList}) {
    return [
      SliverToBoxAdapter(
        child: Container(
            height: 44,
            margin: EdgeInsets.only(left: 15, right: 15),
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: LeftTitle(
              tipColor: AppColors.primaryColor,
              title: 'Products on sale',
            )),
      ),

      /// Product list
      _buildBottomList(supplierList: supplierList),
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          height: 15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: null,
        ),
      ),
    ];
  }

  /// Product list
  Widget _buildBottomList({required List<GoodsList> supplierList}) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 15, right: 15),
      sliver: SliverFixedExtentList(
        itemExtent: 141,
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            // print(index);
            return Container(
              color: Colors.white,
              child: Column(children: <Widget>[
                index == 0 ? Container() : MyDivider(),
                CommdityItem(goodData: supplierList[index]),
              ]),
            );
          },
          childCount: supplierList.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SupplierPageProvider>(context);
    TextStyle infoTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
    return state.loading
        ? MyLoadingWidget()
        : Container(
            color: AppColors.primaryBackground,
            child: SmartRefresher(
              controller: state.refreshController,
              enablePullUp: true,
              enablePullDown: false,
              onLoading: state.loadData,
              footer: MyCustomFooter(),
              child: CustomScrollView(
                slivers: <Widget>[
                      /// Above
                      _buildTop(context, infoTextStyle,
                          supplierName: state.supplierName,
                          contact: state.contact,
                          phoneNum: state.phoneNum,
                          workTime: state.workTime,
                          address:
                              'Huaxi Street, Banan District, Chongqing City'),

                      /// Merchant profile
                      _buildBottomInfo(
                        context,
                        supplierImgUrl: state.supplierImgUrl,
                        introDuceText: state.introDuceText,
                      ),
                    ] +

                    /// Product list
                    _bottomList(supplierList: state.supplierList),
              ),
            ),
          );
  }
}
