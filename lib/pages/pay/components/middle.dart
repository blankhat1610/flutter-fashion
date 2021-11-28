import 'package:flutter/material.dart';

class Middle extends StatelessWidget {
  const Middle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 32,
            child: Text(
              'Payment channels',
              style: TextStyle(
                color: Color(0xFF4A4A4A),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Divider(color: Color(0xffdfdfdf), height: 0.5),
          _buildItem(
            title: 'WeChat Pay',
            tip: '(Opened)',
            img: 'assets/images/pay/check.png',
          ),
          Divider(color: Color(0xffdfdfdf), height: 0.5),
          _buildItem(
            title: 'Alipay',
            tip: '(not open)',
            img: 'assets/images/pay/uncheck.png',
          ),
          Divider(color: Color(0xffdfdfdf), height: 0.5),
          _buildItem(
            title: 'UnionPay',
            tip: '(not open)',
            img: 'assets/images/pay/uncheck.png',
          ),
          Divider(color: Color(0xffdfdfdf), height: 0.5),
          _buildItem(
            title: 'Offline transfer',
            tip: '(Payment certificate needs to be uploaded)',
            img: 'assets/images/pay/uncheck.png',
          ),
        ],
      ),
    );
  }

  /// Each
  Widget _buildItem({
    required String title,
    required String tip,
    required String img,
  }) {
    TextStyle greyText = TextStyle(
      color: Color(0xFFBEBEBE),
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
    TextStyle blackText = TextStyle(
      color: Color(0xFF121212),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: title == 'WeChat Pay' ? blackText : greyText),
              Text(tip, style: greyText),
            ],
          ),
          Image.asset(img, width: 20, height: 20)
        ],
      ),
    );
  }
}
