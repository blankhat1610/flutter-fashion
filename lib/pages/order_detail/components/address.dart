import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle addressText = TextStyle(
      color: Color(0xFF121212),
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );

    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Zhang San', style: addressText),
                Text('18888888888', style: addressText),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width - 50,
            child: Text(
              'Chongqing Yuzhong District Temple Street Hua Xia Zongshen Shop No. 21-6 Address Address Address Address Address Address Address Address Address Address',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF4A4A4A),
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
