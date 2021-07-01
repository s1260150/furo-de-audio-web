import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animController;

  final _focusNode = FocusNode();
  bool _isFocus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    final curvedAnimation =
        CurvedAnimation(parent: _animController, curve: Curves.ease);

    _animation = Tween<double>(begin: 0, end: 150).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      setState(() {
        _isFocus = _focusNode.hasFocus;
        if (_isFocus) {
          _animController.forward();
        } else {
          _animController.reverse();
        }
        debugPrint("isFocus: " + _isFocus.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 50,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Opacity(
            opacity: 1.0 - _animation.value / 150,
            child: Container(
                width: 50,
                child: IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: _isFocus
                      ? null
                      : () {
                          _focusNode.requestFocus();
                        },
                )),
          ),
          Container(
            width: _animation.value,
            height: 50,
            child: Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 5.0),
                child: TextField(
                  focusNode: _focusNode,
                  style: TextStyle(color: Colors.black),
                )),
          ),
        ]));
  }
}
