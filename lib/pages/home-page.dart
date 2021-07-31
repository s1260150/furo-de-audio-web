import 'package:flutter/material.dart';
import '../models/music.dart';
import '../organisms/music-container.dart';
import '../../types/music-player-callback.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.onPlayed}) : super(key: key);

  final MusicPlayerCallback onPlayed;

  final List<Music> musics = [
    Music(
        id: "id",
        title: "title",
        artist: "artist",
        duration: "194000",
        progress: "progress",
        img: "https://i.scdn.co/image/9f05124de35d807b78563ea2ca69550325081747",
        uri: "uri"),
    Music(
        id: "id",
        title: "title",
        artist: "artist",
        duration: "195000",
        progress: "progress",
        img: "https://i.scdn.co/image/92ae5b0fe64870c09004dd2e745a4fb1bf7de39d",
        uri: "uri"),
    Music(
        id: "id",
        title: "title",
        artist: "artist",
        duration: "196000",
        progress: "progress",
        img: "https://i.scdn.co/image/4f19eb7986a7c2246d713dcc46684e2187ccea4f",
        uri: "uri"),
    Music(
        id: "id",
        title: "title",
        artist: "artist",
        duration: "194000",
        progress: "progress",
        img: "https://i.scdn.co/image/9f05124de35d807b78563ea2ca69550325081747",
        uri: "uri"),
    Music(
        id: "id",
        title: "title",
        artist: "artist",
        duration: "195000",
        progress: "progress",
        img: "https://i.scdn.co/image/92ae5b0fe64870c09004dd2e745a4fb1bf7de39d",
        uri: "uri"),
    Music(
        id: "id",
        title: "title",
        artist: "artist",
        duration: "196000",
        progress: "progress",
        img: "https://i.scdn.co/image/4f19eb7986a7c2246d713dcc46684e2187ccea4f",
        uri: "uri"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            MusicContainer(musics: musics, onPlayed: onPlayed),
            Text(
              "Reccommend",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            MusicContainer(musics: musics, onPlayed: onPlayed),
          ],
        )));
  }
}
