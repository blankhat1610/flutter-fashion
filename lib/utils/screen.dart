import 'package:flutter_screenutil/flutter_screenutil.dart';
/*
  ScreenUtil.pixelRatio //The pixel density of the device
    ScreenUtil.screenWidth //Device width
    ScreenUtil.screenHeight //Device height
    ScreenUtil.bottomBarHeight //The distance of the bottom safe zone, suitable for buttons under the full screen
    ScreenUtil.statusBarHeight //The height of the status bar will be higher than the screen will be higher in px
    ScreenUtil.textScaleFactor //System font scaling
    
    ScreenUtil().scaleWidth // The ratio of the actual width dp to the design draft px
    ScreenUtil().scaleHeight // The ratio of actual height dp to design draft px
*/

/// set the width
double duSetWidth(double width) {
  return ScreenUtil().setWidth(width);
}

/// set the width
double duSetHeight(double height) {
  return ScreenUtil().setHeight(height);
}

/// Set font size
double duSetFontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}
