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
    // Search keywords passed in from other pages, the default is ``
    _textEditController.text = widget.keyword;
    return Container(
      height: 49,
      padding: EdgeInsets.only(top: 7, right: 15, bottom: 7, left: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Opacity(
              opacity: 0.1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F7F7),
                  borderRadius: BorderRadius.circular(49 * 0.5),
                ),
                child: Container(
                  child: TextField(
                    controller: _textEditController,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        'assets/images/home/sousuo.png',
                        width: 15,
                        height: 15,
                      ),
                      isDense: true,
                      hintText: "Maximum drop is 8000",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                    ),
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
                  color: Colors.white,
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
