import 'package:flutter/material.dart';
import '../models/music.dart';
import 'dart:math' as math;

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key, required this.music, required this.clear})
      : super(key: key);

  final Music music;

  final VoidCallback clear;

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  double progress = 100.0;

  setProgress(double percentage) {
    setState(() {
      progress = percentage * MediaQuery.of(context).size.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 64,
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                      width: 96,
                      child:
                          Image.network(widget.music.img, fit: BoxFit.cover)),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(top: 6),
                                      padding: EdgeInsets.only(left: 4),
                                      child: Text(widget.music.title,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18)))),
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(top: 1),
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(widget.music.artist,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16)))),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.only(right: 12),
                                child: SizedBox(
                                    width: 32,
                                    height: 32,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: new Icon(Icons.replay_10,
                                            size: 28, color: Colors.black54)))),
                            Container(
                                padding: EdgeInsets.only(right: 12),
                                child: SizedBox(
                                    width: 32,
                                    height: 32,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: new Icon(Icons.play_arrow_sharp,
                                            size: 28, color: Colors.black54)))),
                            Container(
                                padding: EdgeInsets.only(right: 12),
                                child: SizedBox(
                                    width: 32,
                                    height: 32,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Transform(
                                            alignment: Alignment.center,
                                            transform:
                                                Matrix4.rotationY(math.pi),
                                            child: new Icon(Icons.replay_10,
                                                size: 28,
                                                color: Colors.black54))))),
                            Container(
                                padding: EdgeInsets.only(right: 12),
                                child: SizedBox(
                                    width: 32,
                                    height: 32,
                                    child: TextButton(
                                        onPressed: widget.clear,
                                        child: new Icon(Icons.close,
                                            size: 28, color: Colors.black54)))),
                          ],
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: progress,
                  height: 2,
                  color: Color(int.parse('0xff79bcff')),
                ))
          ],
        ));
  }
}
