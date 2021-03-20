import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModelGirl extends StatelessWidget {
  String url;
  String name;
  String city;

  ModelGirl({this.url, this.name, this.city});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28.0),
                child: Hero(
                    tag: "modelImg",
                    child: Image.network(url, fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
            ),
            Text(
              city,
              style: TextStyle(fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    ]);
  }
}
