import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryTextTheme: TextTheme(title: TextStyle(color: Colors.black))),
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _navIndex = 0;
  String _label = '';
  final _titles = ['Home', 'Library', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('furo-de-audio'),
        actions: [
          SearchBar(),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            title: Text('Library'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        onTap: (int index) {
          setState(
            () {
              _navIndex = index;
              _label = _titles[index];
            },
          );
        },
        currentIndex: _navIndex,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                _label,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    final curvedAnimation =
        CurvedAnimation(parent: _animController, curve: Curves.easeOutSine);

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
          Visibility(
            visible: !_isFocus,
            child: Container(
                width: 50,
                child: IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {
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
                  ))),
        ]));
  }
}
