import 'package:AiRi/components/components.dart';
import 'package:AiRi/model/goods.dart';
import 'package:AiRi/pages/manage/store/manage_page_provider.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:AiRi/styles/iconfont.dart';
import 'package:AiRi/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ManagePage extends StatelessWidget {
  final String? supplierId;
  const ManagePage({Key? key, this.supplierId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ManagePageProvider(),
      child: Scaffold(
        body: ManageContainer(),
        backgroundColor: AppColors.supplierColor1,
      ),
    );
  }
}

class ManageContainer extends StatelessWidget {
  const ManageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ManagePageProvider>(context);
    return Container(
      color: AppColors.primaryBackground,
      child: SmartRefresher(
        controller: state.refreshController,
        enablePullUp: true,
        enablePullDown: false,
        onLoading: state.loadData,
        footer: MyCustomFooter(),
        child: CustomScrollView(
          slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Stack(
                    children: <Widget>[
                      _buildTop(context),
                      _buildFunc(context),
                      _buildImageRecommend(context),
                      _buildMoreFunc(context),
                    ],
                  ),
                ),
              ] +
              _hotCommodity(state.hotList),
        ),
      ),
    );
  }

  /// Above
  Widget _buildTop(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 20, top: MediaQuery.of(context).padding.top + 20),
      height: 240,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //Background radial gradient
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.supplierColor1, AppColors.supplierColor2],
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.network(
                    'https://yanxuan.nosdn.127.net/4cb504b640d917efcccf5fe6c73f6428.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Jue Fei',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Divider(height: 5),
                      Text('I know you better when filling in your interests~',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 90,
            height: 70,
            child: Center(
              child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.splashColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Iconfont.redpacket_fil,
                        color: AppColors.buyNow2, size: 18),
                    Text(
                      'Daily check-in',
                      style:
                          TextStyle(color: AppColors.primaryText, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// My function
  Widget _buildFunc(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 100, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: LeftTitle(
              title: 'My function',
            ),
          ),
          MyDivider(),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIconItem(Iconfont.ticket_fill, '优惠券', Color(0xFF4A4A4A),
                    AppColors.primaryText),
                _buildIconItem(Iconfont.redpacket_fil, '红包', Color(0xFF4A4A4A),
                    AppColors.primaryText),
                _buildIconItem(Iconfont.round_like_fill, 'My Collection',
                    Color(0xFF4A4A4A), AppColors.primaryText),
                _buildIconItem(Iconfont.card_fill, 'Bank Card',
                    Color(0xFF4A4A4A), AppColors.primaryText),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Picture recommendation
  Widget _buildImageRecommend(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width - 20,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 230, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          'https://gw.alicdn.com/imgextra/i3/43/O1CN01ZPUEId1CBjWPLKzea_!!43-0-lubanu.jpg',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  /// More tools
  Widget _buildMoreFunc(BuildContext context) {
    Color iconColor = Color(0xFF505257);
    return Container(
      height: 250,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 330, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10),
            child: LeftTitle(
              title: 'More tools',
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIconItem(Iconfont.news_light, 'My Assets', iconColor,
                    AppColors.primaryText),
                _buildIconItem(Iconfont.game, 'Daily Welfare', iconColor,
                    AppColors.primaryText),
                _buildIconItem(Iconfont.magic, 'I want to customize', iconColor,
                    AppColors.primaryText),
                _buildIconItem(Iconfont.question, 'Official Customer Service',
                    iconColor, AppColors.primaryText),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIconItem(Iconfont.haodian, 'daily good shop', iconColor,
                    AppColors.primaryText),
                _buildIconItem(Iconfont.tian, 'Daily Welfare', iconColor,
                    AppColors.primaryText),
                _buildIconItem(Iconfont.qi, 'Enterprise Procurement', iconColor,
                    AppColors.primaryText),
                _buildIconItem(Iconfont.shuang11, 'Chop Hand Double 11',
                    iconColor, AppColors.primaryText),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIconItem(Iconfont.we_fill_light, 'wish list', iconColor,
                    AppColors.primaryText),
                _buildIconItem(Iconfont.shop_light, '线下门店', iconColor,
                    AppColors.primaryText),
                _buildIconItem(Iconfont.sports, 'Sports Health', iconColor,
                    AppColors.primaryText),
                _buildIconItem(Iconfont.discover, 'discovery discovery',
                    iconColor, AppColors.primaryText),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Hot sales area
  List<Widget> _hotCommodity(List<GoodsList> hotList) {
    return [
      SliverToBoxAdapter(
        child: Container(
          height: 44,
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          child: LeftTitle(
            tipColor: AppColors.primaryColor,
            title: 'Exclusive recommendation',
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Wrap(
            spacing: 8.0, // Spacing in the main axis (horizontal) direction
            runSpacing:
                10.0, // Spacing in the vertical axis (vertical) direction
            alignment: WrapAlignment.start, //center along the main axis
            direction: Axis.horizontal,
            children: hotList.map<Widget>(
              (item) {
                return CommdityItemHome(goodData: item);
              },
            ).toList(),
          ),
        ),
      ),
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

  /// each icon
  Widget _buildIconItem(
      IconData iconData, String title, Color iconColor, Color textColor) {
    return Column(
      children: <Widget>[
        Icon(
          iconData,
          color: iconColor,
          size: 28,
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: textColor, fontSize: 12),
        )
      ],
    );
  }
}
