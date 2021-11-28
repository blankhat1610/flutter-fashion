import 'package:AiRi/components/components.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/utils/my_navigator.dart';

class ChooseAddress extends StatelessWidget {
  const ChooseAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.Back,
      title: 'Select address',
      body: ChooseAddressContainer(),
    );
  }
}

class ChooseAddressContainer extends StatelessWidget {
  const ChooseAddressContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List addAressList = [1, 2, 3];
    return Container(
      color: Color(0xFFF7F7F7),
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: addAressList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  MyNavigator.pop(data: addAressList[index]);
                },
                child: _buildItem(context));
          }),
    );
  }

  /// Each
  Widget _buildItem(BuildContext context) {
    TextStyle nameText = TextStyle(
      color: Color(0xFF121212),
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
    TextStyle addressText = TextStyle(
      color: Color(0xFF4A4A4A),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 10, bottom: 15, left: 15, right: 15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Zhang Xiaofeng', style: nameText),
                  Text('18888888888', style: nameText),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width - 30,
                child: Text(
                  'No. 21-6, Xintiandi Center, Yubei District, Chongqing City , Chongqing, Yubei District, Chongqing City , Chongqing City , Chongqing',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: addressText,
                ),
              ),
            ],
          ),
        ),
        MyDivider()
      ],
    );
  }
}
