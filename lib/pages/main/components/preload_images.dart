import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/* Preload image*/
class PreloadImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children: <Widget>[
        Image.memory(kTransparentImage),
        Image.asset('assets/images/tabbar/zhuye_off.png'),
        Image.asset('assets/images/tabbar/fenlei_ON.png'),
        Image.asset('assets/images/tabbar/diangdan_ON.png'),
        Image.asset('assets/images/tabbar/guanli_ON.png'),
        Image.asset('assets/images/tabbar/zhuye_off.png'),
        Image.asset('assets/images/tabbar/fenlei_ON.png'),
        Image.asset('assets/images/tabbar/diangdan_ON.png'),
        Image.asset('assets/images/tabbar/guanli_ON.png'),
      ],
    );
  }
}
