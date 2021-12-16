import 'package:fashion/components/components.dart';
import 'package:fashion/model/goods.dart';
import 'package:fashion/pages/home/components/brand_swiper.dart';
import 'package:fashion/pages/home/components/commodity_category.dart';
import 'package:fashion/pages/home/components/head_swiper.dart';
import 'package:fashion/pages/home/store/home_page_provider.dart';
import 'package:fashion/pages/main/components/preload_images.dart';
import 'package:fashion/pages/search/search_page.dart';
import 'package:fashion/styles/colors.dart';
import 'package:fashion/utils/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) => HomePageProvider(),
      child: BaseScaffold(
        leadType: AppBarBackType.None,
        actions: <Widget>[AppBarShopCartIconButton()],
        title: 'Home page',
        centerTitle: true,
        body: HomePageContainer(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class HomePageContainer extends StatefulWidget {
  @override
  _HomePageContainerState createState() => _HomePageContainerState();
}

class _HomePageContainerState extends State<HomePageContainer> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomePageProvider>(context);

    return state.loading
        ? MyLoadingWidget()
        : Container(
            color: AppColors.primaryBackground,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: SmartRefresher(
                controller: state.refreshController,
                enablePullUp: true,
                onRefresh: () => state.initData(refresh: true),
                onLoading: state.loadData,
                header: WaterDropMaterialHeader(),
                footer: MyCustomFooter(),
                child: CustomScrollView(
                  slivers: <Widget>[
                        // preload image
                        SliverToBoxAdapter(
                          child: Container(
                            height: 0,
                            child: PreloadImages(),
                          ),
                        ),

                        /// search bar
                        SliverToBoxAdapter(
                          child: SearchBar(
                              myOntap: (value) => MyNavigator.push(
                                  SearchPage(title: 'Search', keyword: value))),
                        ),

                        /// Top carousel picture
                        SliverToBoxAdapter(
                          child: HeadSwiper(
                            bannerList: state.banerList,
                          ),
                        ),

                        /// Commodity classification area
                        SliverToBoxAdapter(
                          child: CommodityCateGory(
                              cateGoryList: state.cateGoryList),
                        ),

                        /// Brand carousel area
                        SliverToBoxAdapter(
                          child: BrandSwiper(brandList: state.brandList),
                        ),

                        /// Hot sales area
                      ] +
                      _hotCommodity(state.hotList),
                ),
              ),
            ),
          );
  }

  /// Hot sales area
  List<Widget> _hotCommodity(List<GoodsList> hotList) {
    return [
      SliverToBoxAdapter(
        child: Container(
            height: 44,
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
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
              title: 'Hot Products',
            )),
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
}
