import 'dart:convert';
import 'package:flutter/material.dart';

import 'Card_details.dart';

class CardItem extends StatelessWidget {
  final String id;
  final String title;
  final String image1;
  final String image2;
  final String article;
  final String youtube;
  final String description;


  CardItem({
    required this.id,
    required this.title,
    required this.image1,
    required this.image2,
    required this.article,
    required this.youtube,
    required this.description,
  });

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return CardDetailScreen(
              this.id, this.title, this.image1, this.image2, this.article, this.youtube, this.description);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: Image.memory(
                    base64Decode(image1),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),

                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}