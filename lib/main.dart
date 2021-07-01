import 'package:flutter/material.dart';
import './library-page.dart';
import './search-bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _navIndex = 0;
  final _titles = ['Home', 'Library', 'Settings'];

  final List<TabItem> tabItems = [
    TabItem(
      'Home',
      Icon(Icons.home),
      Center(
        child: Text(
          'Home',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    ),
    TabItem('Library', Icon(Icons.library_music), LibraryPage()),
    TabItem(
      'Settings',
      Icon(Icons.settings),
      Center(
        child: Text(
          'Settings',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final FocusScopeNode currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryTextTheme:
                  TextTheme(title: TextStyle(color: Colors.black))),
          home: Scaffold(
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
              items: tabItems.map((item) {
                return BottomNavigationBarItem(
                  icon: item.icon,
                  label: item.txt,
                );
              }).toList(),
              onTap: (int index) {
                setState(
                  () {
                    _navIndex = index;
                  },
                );
              },
              currentIndex: _navIndex,
            ),
            body: tabItems[_navIndex].content,
          ),
        ));
  }
}

class TabItem {
  String txt;
  Icon icon;
  Widget content;

  TabItem(this.txt, this.icon, this.content);
}
