import 'package:flutter/material.dart';
import '../models/music.dart';
import '../types/music-player-callback.dart';

class MusicCard extends StatelessWidget {
  MusicCard({Key? key, required this.music, required this.onPressed})
      : super(key: key);

  final MusicPlayerCallback onPressed;

  final Music music;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
          height: 62,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), color: Colors.white10),
          child: Row(
            children: [
              Expanded(
                  child: Stack(fit: StackFit.expand, children: [
                Image.network(music.img, fit: BoxFit.cover),
                Container(
                  color: Colors.black.withOpacity(0.3),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.only(top: 2, left: 12),
                            margin: EdgeInsets.only(right: 12),
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Container(
                                        child: Text(music.title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 24)))),
                                Expanded(
                                    child: Container(
                                        margin: EdgeInsets.only(top: 3),
                                        padding: EdgeInsets.only(left: 12),
                                        child: Text(music.artist,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16)))),
                              ],
                            ))),
                    Container(
                      padding: EdgeInsets.only(right: 6, bottom: 8),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${(int.parse(music.duration) / 60000).floor()}:${(int.parse(music.duration) % 60000 / 1000).floor()}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ])),
              Container(
                  width: 64,
                  child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            onPressed(music);
                          },
                          child: new Icon(Icons.play_arrow_sharp,
                              size: 36, color: Colors.black54))))
            ],
          )),
    );
  }
}
