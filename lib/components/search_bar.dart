import 'package:fashion/styles/colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final String keyword;
  final Function myOntap;
  const SearchBar({Key? key, required this.myOntap, this.keyword = ''})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // For search keywords passed in from other pages, bind the value of the current input box to the value passed in
    _textEditController.text = widget.keyword;
    // Control the cursor position in the input box as the last word
    _textEditController.selection = TextSelection.fromPosition(
      TextPosition(
          affinity: TextAffinity.downstream, offset: widget.keyword.length),
    );
    return Container(
      color: Colors.white,
      height: 49,
      padding: EdgeInsets.only(top: 7, right: 15, bottom: 7, left: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F7F7),
                borderRadius: BorderRadius.circular(49 * 0.5),
              ),
              child: Container(
                child: TextField(
                  controller: _textEditController,
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'assets/images/home/sousuo.png',
                      width: 15,
                      height: 15,
                    ),
                    isDense: true,
                    hintText: "Search clothes here",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            /// Pass the input value callback to the click function
            onTap: () => widget.myOntap(_textEditController.text),
            child: Container(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'Search',
                style: TextStyle(
                  color: Color(0xFF17191A),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
