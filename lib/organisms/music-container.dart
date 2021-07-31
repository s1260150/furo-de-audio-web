import 'package:flutter/material.dart';
import '../models/music.dart';
import './music-card.dart';
import '../types/music-player-callback.dart';

class MusicContainer extends StatelessWidget {
  final List<Music> musics;

  MusicContainer({Key? key, required this.musics, required this.onPlayed})
      : super(key: key);

  final MusicPlayerCallback onPlayed;

  List<Widget> musicCardList() {
    var cardList = <MusicCard>[];

    for (var music in musics) {
      cardList.add(MusicCard(music: music, onPressed: onPlayed));
    }

    return cardList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: musicCardList(),
      ),
    );
  }
}
