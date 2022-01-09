import 'package:fashion/styles/colors.dart';
import 'package:flutter/material.dart';

class IntroductionAndConfiguration extends StatefulWidget {
  const IntroductionAndConfiguration({Key? key}) : super(key: key);

  @override
  _IntroductionAndConfigurationState createState() =>
      _IntroductionAndConfigurationState();
}

class _IntroductionAndConfigurationState
    extends State<IntroductionAndConfiguration> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  /// upper tab
  Widget _buildTopTab() {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              this.setState(() {
                _currentPage = 0;
                _pageController.animateToPage(
                  0,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              });
            },
            child: Container(
              height: 40,
              width: (MediaQuery.of(context).size.width - 30) / 2,
              color: _currentPage == 0
                  ? Colors.white
                  : AppColors.primaryBackground,
              child: Center(child: Text('product introduction')),
            ),
          ),
          ClipPath(
            child: Container(
              width: 30,
              color: Colors.white,
            ),
            clipper:
                _currentPage == 0 ? MyClipperLeft() : MyClipperRight(), //裁剪
          ),
          GestureDetector(
            onTap: () {
              this.setState(() {
                _currentPage = 1;
                _pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              });
            },
            child: Container(
              height: 40,
              width: (MediaQuery.of(context).size.width - 30) / 2,
              color: _currentPage == 1
                  ? Colors.white
                  : AppColors.primaryBackground,
              child: Center(child: Text('Product Configuration')),
            ),
          ),
        ],
      ),
    );
  }

  /// Content below
  Widget _buildBottomContent() {
    return Container(
      height: 100,
      padding: EdgeInsets.only(top: 30),
      color: Colors.white,
      child: PageView(
        physics: new NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          Container(
            child: Center(child: Text('product introduction')),
          ),
          Container(
            child: Center(child: Text('Product Configuration')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // upper tab
        _buildTopTab(),
        // content below
        _buildBottomContent(),
      ],
    );
  }
}

/// Cut on the left when tab switching
class MyClipperLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //x coordinate is 0.0 y coordinate is height
    //The x coordinate is the width and the y coordinate is the result of the height reaching the diagonal line
    //Finish
    var path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

/// Right cropping when tab switching
class MyClipperRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Move the origin of the coordinate axis to the width and height
    //x coordinate is width, y coordinate is 0.0
    //x coordinate is 0.0, y coordinate is height
    //Finish
    var path = Path()
      ..moveTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
