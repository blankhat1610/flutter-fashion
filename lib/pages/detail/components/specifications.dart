import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion/components/bottom_button.dart';
import 'package:fashion/components/components.dart';
import 'package:fashion/model/detail.dart';
import 'package:fashion/styles/colors.dart';
import 'package:flutter/material.dart';

class Specifications extends StatelessWidget {
  final String image;
  final String guidePrice;
  final String price;
  final String miniBuyNum;
  final List<SpecificationList> specificationList;

  const Specifications(
      {Key? key,
      required this.guidePrice,
      required this.miniBuyNum,
      required this.specificationList,
      required this.image,
      required this.price})
      : super(key: key);

  /////////////// Dialog UI
  /// The upper part of the dialog box
  Widget _buildDialogTop(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
      // color: Colors.red,
      height: 120,
      child: Stack(
        children: <Widget>[
          //Upper right button
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.close,
                color: Color(0xFF000000),
                size: 24.0,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: CachedNetworkImage(
              imageUrl: image,
              height: 120,
              width: 120,
            ),
          ),
          Positioned(
            top: 17,
            left: 135,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 7),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Preferential price',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Positioned(
            top: 42,
            left: 135,
            child: RichText(
              text: TextSpan(
                  text: '￥',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '$price',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ]),
            ),
          ),
          Positioned(
            top: 83.5,
            left: 135,
            child: Text(
              'Quantity',
              style: TextStyle(
                color: AppColors.primaryGreyText,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            top: 83.5,
            right: 85,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset(
                'assets/images/detail/dowm.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
          Positioned(
            top: 78.5,
            right: 35,
            child: Container(
              width: 40,
              height: 30,
              color: Color(0xFFF3F3F3),
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    color: AppColors.primaryGreyText,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 83.5,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset(
                'assets/images/detail/up.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// The bottom part of the dialog box
  Widget _buildDialogBottom(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 15),
      child: Column(
        children: specificationList.map((item) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 15, top: 15),
                  child: Text(
                    item.name,
                    style: TextStyle(
                      color: AppColors.primaryGreyText,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Wrap(
                    spacing:
                        15.0, // Spacing in the main axis (horizontal) direction
                    runSpacing: 15.0,
                    alignment: WrapAlignment.start, //center along the main axis
                    children: item.specification.map<Widget>((item) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            color: Color(0xFF4A4A4A),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Dialog
  Widget _buildDialog(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.75 -
                60 -
                MediaQuery.of(context).padding.bottom,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  /// The upper part of the dialog box
                  _buildDialogTop(context),

                  /// The bottom part of the dialog box
                  _buildDialogBottom(context),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomButton(
              text: 'OK',
              handleOk: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  ///// Specification UI
  /// first row
  Widget _buildUp(TextStyle geryText) {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Guide retail price', style: geryText),
          Text('￥$guidePrice', style: geryText),
        ],
      ),
    );
  }

  /// second line
  Widget _buildMiddle(TextStyle geryText) {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Minimum Purchase Quantity', style: geryText),
          Text('$miniBuyNum件', style: geryText),
        ],
      ),
    );
  }

  /// Specification selection
  Widget _buildBottom(BuildContext context, TextStyle geryText,
      TextStyle specificationTextStyle) {
    return Container(
      height: 40,
      child: GestureDetector(
        onTap: () => openDialog(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('selected', style: geryText),
            Row(
              children: <Widget>[
                Container(
                  child: Text('Please select the specification quantity',
                      style: specificationTextStyle),
                ),
                Container(
                  width: 20,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Color(0xFF000000),
                    size: 20.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// Open the dialog box to select specifications
  void openDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        builder: (BuildContext context) {
          return _buildDialog(context);
        });
  }

  @override
  Widget build(BuildContext context) {
    /// Gray font
    TextStyle geryText = TextStyle(
      color: Color(0xFF9B9B9B),
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
    // Choose standard font
    TextStyle specificationTextStyle = TextStyle(
      color: AppColors.primaryText,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    return Container(
      height: 121,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          _buildUp(geryText),
          MyDivider(),
          _buildMiddle(geryText),
          _buildBottom(context, geryText, specificationTextStyle),
        ],
      ),
    );
  }
}
