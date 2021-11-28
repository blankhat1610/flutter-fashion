import 'package:AiRi/components/components.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AiRi/pages/main/store/main_provider.dart';
import 'package:AiRi/pages/order/components/order_item.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = [
    "All",
    "Pending Payment",
    "Pending Order",
    "Pending Shipment",
    "Pending Receipt",
    "Completed"
  ];

  @override
  void initState() {
    // Create Controller
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.None,
      actions: <Widget>[AppBarShopCartIconButton()],
      title: 'Order',
      body: OrderPageContainer(tabController: _tabController, tabs: tabs),
    );
  }
}

class OrderPageContainer extends StatelessWidget {
  const OrderPageContainer({
    Key? key,
    required TabController tabController,
    required this.tabs,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final List tabs;

  @override
  Widget build(BuildContext context) {
    List orderList = [1, 1, 1];
    final mainProvder = Provider.of<MainProvider>(context, listen: false);

    return Column(
      children: <Widget>[
        _buildTab(),
        Expanded(
          child: Container(
            color: Color(0xFFF7F7F7),
            child: TabBarView(
              controller: _tabController,
              children: tabs.map((_) {
                return orderList.length == 0
                    ? Empty(
                        img: 'assets/images/order/empty.png',
                        tipText: 'There is no related order~',
                        buttonText: 'Go to purchase',
                        buttonTap: () =>
                            {mainProvder.setTabBarSelectedIndex = 0},
                      )
                    : ListView.builder(
                        itemCount: orderList.length,
                        itemBuilder: (context, index) {
                          return OrderItem(orderItemData: orderList[index]);
                        });
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTab() {
    return Container(
      height: 49,
      child: TabBar(
        controller: _tabController,
        // indicator: UnderlineIndicator(
        //   strokeCap: StrokeCap.round,
        //   borderSide: BorderSide(
        //     color: AppColors.tabBarActive,
        //     width: 2,
        //   ),
        //   insets: EdgeInsets.only(left: 20, right: 20),
        // ),
        isScrollable: true,
        labelColor: AppColors.tabBarActive,
        unselectedLabelColor: AppColors.primaryGreyText,
        tabs: tabs
            .map((e) => Container(
                  child: Tab(text: e),
                ))
            .toList(),
      ),
    );
  }
}
