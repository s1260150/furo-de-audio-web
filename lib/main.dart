import 'package:flutter/material.dart';
import './models/music.dart';
import './models/tab-item.dart';
import 'pages/library-page.dart';
import 'organisms/search-bar.dart';
import 'pages/home-page.dart';
import 'pages/settings-page.dart';
import 'organisms/music-player.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _navIndex = 0;
  final _titles = ['Home', 'Library', 'Settings'];

  bool isPlayerShown = true;
  Music playingMusic = Music(
      id: "id",
      title: "title",
      artist: "artist",
      duration: "194000",
      progress: "progress",
      img: "https://i.scdn.co/image/9f05124de35d807b78563ea2ca69550325081747",
      uri: "uri");

  final List<TabItem> tabItems = [];

  @override
  void initState() {
    tabItems.add(TabItem(
        'Home',
        Icon(Icons.home),
        HomePage(
          onPlayed: showPlayer,
        )));
    tabItems.add(TabItem('Library', Icon(Icons.library_music), LibraryPage()));
    tabItems.add(TabItem('Settings', Icon(Icons.settings), SettingsPage()));

    super.initState();
  }

  void showPlayer(Music music) {
    setState(() {
      playingMusic = music;
      isPlayerShown = true;
    });
  }

  void unshowPlayer() {
    setState(() {
      isPlayerShown = false;
    });
  }

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
            body: Column(
              children: [
                Expanded(child: tabItems[_navIndex].content),
                isPlayerShown
                    ? MusicPlayer(
                        music: playingMusic,
                        clear: () {
                          setState(() {
                            isPlayerShown = false;
                          });
                        })
                    : Container()
              ],
            ),
          ),
        ));
  }
}
