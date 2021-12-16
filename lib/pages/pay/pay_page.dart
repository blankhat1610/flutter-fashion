import 'package:fashion/components/components.dart';
import 'package:fashion/pages/main/store/main_provider.dart';
import 'package:fashion/styles/colors.dart';
import 'package:fashion/utils/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/middle.dart';
import 'components/top.dart';

class PayPage extends StatelessWidget {
  final String orderId;

  const PayPage({Key? key, required this.orderId}) : super(key: key);

  /// Cancel order dialog
  Future<bool> _showCancelDialog(BuildContext context) async {
    final result = await showDialog<int>(
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
                      'Are you sure to give up payment? ',
                      style:
                          TextStyle(color: Color(0xFF4A4A4A), fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            confirmContent: 'Continue payment',
            confirmTextColor: AppColors.priceColor,
            cancelContent: 'Temporarily give up',
            isCancel: true,
          );
        });

    return result == 0;
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.Back,
      onWillPop: () async {
        final isCancelPay = await _showCancelDialog(context);
        return isCancelPay;
      },
      title: 'Cashier Counter',
      body: PayPageContainer(),
    );
  }
}

class PayPageContainer extends StatelessWidget {
  const PayPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7F7F7),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Top(), Middle()],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomButton(
              text: 'Pay immediately',
              handleOk: () => _showSuccessDialog(context),
            ),
          ),
        ],
      ),
    );
  }

  // Payment successful dialog
  void _showSuccessDialog(BuildContext context) async {
    MyDialog.showLoading('', barrier: true);
    await Future.delayed(Duration(seconds: 2), () {});
    MyDialog.hideLoading();

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CustomDialog(
            content: Center(
              child: Column(
                children: <Widget>[
                  Image.asset(
                      'assets/images/confirm_order/dingdanchenggong.png'),
                  Container(
                    padding: EdgeInsets.only(bottom: 0.0, top: 10),
                    child: Text(
                      'Payment successful',
                      style:
                          TextStyle(color: Color(0xFF4A4A4A), fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            confirmContent: 'View order',
            confirmTextColor: AppColors.buyNow1,
            cancelContent: 'Continue purchasing',
            isCancel: true,
            confirmCallback: () {
              // check order
              final mainProvder =
                  Provider.of<MainProvider>(context, listen: false);
              mainProvder.setTabBarSelectedIndex = 1;
            },
            dismissCallback: () {
              // Continue to purchase
              MyNavigator.popToHome();
            },
          );
        });
  }
}
