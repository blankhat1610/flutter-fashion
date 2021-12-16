import 'package:fashion/styles/colors.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  /// picture
  final String img;

  /// Prompt text
  final String tipText;

  /// Button text
  final String buttonText;

  /// Button event
  final Function buttonTap;
  const Empty({
    Key? key,
    required this.img,
    required this.tipText,
    required this.buttonText,
    required this.buttonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        child: Column(
          children: <Widget>[
            Image.asset(
              img,
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              tipText,
              style: TextStyle(
                color: Color(0xFF4A4A4A),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 120,
              height: 40.5,
              child: OutlineButton(
                onPressed: () => buttonTap,
                borderSide: BorderSide(color: AppColors.primaryColor),
                splashColor: AppColors.primaryColor,
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
