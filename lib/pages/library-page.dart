import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: TabBar(
                isScrollable: false,
                tabs: ['Spotify', 'Device'].map((txt) {
                  return Tab(text: txt);
                }).toList(),
                indicatorColor: Colors.redAccent,
                labelColor: Colors.black,
              ))
            ]),
            Expanded(
                child: TabBarView(
              children: [SpotifyListView(listItems: []), Text("")],
            ))
          ],
        ));
  }
}

class SpotifyListView extends StatelessWidget {
  final List<SpotifyListItem> listItems;

  const SpotifyListView({required this.listItems, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SpotifyListItem(icon: Icon(Icons.collections), text: "History"),
      SpotifyListItem(icon: Icon(Icons.favorite), text: "Favorite"),
      Divider(
        color: Colors.grey,
        thickness: 1,
        height: 5,
        indent: 10,
        endIndent: 10,
      ),
      Expanded(
          child: Scrollbar(
              child: ListView(
        children: [
          for (int i = 0; i < 15; ++i)
            SpotifyListItem(
                icon: Icon(Icons.collections_bookmark), text: 'item$i')
        ],
      )))
    ]);
  }
}

class SpotifyListItem extends StatelessWidget {
  final Icon icon;
  final String text;

  const SpotifyListItem({required this.icon, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(text),
    );
  }
}
