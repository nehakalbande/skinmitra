import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CardDetailScreen extends StatefulWidget {
  //Structuring the animal detail screen.
  final String id;
  final String title;
  final String image1;
  final String image2;
  final String article;
  final String youtube;
  final String description;


  CardDetailScreen(
      this.id,
      this.title,
      this.image1,
      this.image2,
      this.article,
      this.youtube,
      this.description,
      );

  @override
  _CardDetailScreenState createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {

  Future<void>? _launched;
  Future<void> _launchurl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.youtube)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
            widget.title,
            ),
        centerTitle: true,

      ),
      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,

              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: Image.memory(
                      base64Decode(widget.image1),
                      height: MediaQuery.of(context).size.height*0.3,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),

                ],
              ),
            ),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,

              child: Column(
                children: <Widget>[
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),



            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: YoutubePlayer(
                      controller: _controller,
                      liveUIColor: Colors.amber,
                    ),
                  ),

                ],
              ),
            ),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {_launchurl(widget.article);},
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      padding: EdgeInsets.symmetric(vertical: 13),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.blue.withAlpha(100),
                                offset: Offset(2, 4),
                                blurRadius: 10,
                                spreadRadius: 4)
                          ],
                          color: Colors.blue.withOpacity(0.8)),
                      child: Text(
                        "Find Out More !!",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}