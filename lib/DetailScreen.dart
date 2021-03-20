import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailScreen extends StatefulWidget {
  String imgUrl;

  DetailScreen({this.imgUrl});

  @override
  _DetailScreenState createState() => _DetailScreenState(imgUrl: imgUrl);
}

class _DetailScreenState extends State<DetailScreen> {
  String imgUrl;

  _DetailScreenState({this.imgUrl});

  @override
  void initState() {
    super.initState();
  }

  int likesCount = 579;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Hero(
                tag: "modelImg",
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                )),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {},
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.comment,
                          color: Colors.white,
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "3",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkResponse(
                          onTap: (){
                            setState(() {
                              if(isLiked){
                                likesCount--;
                              } else {
                                likesCount++;
                              }
                              isLiked = !isLiked;
                            });
                          },
                          child: FaIcon(
                            isLiked? FontAwesomeIcons.solidHeart: FontAwesomeIcons.heart,
                            color: Colors.white,
                            size: 30
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$likesCount",
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: Colors.white,
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text("18", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Wrap(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                            child: Container(
                              padding: EdgeInsets.all(25),
                              color: Color.fromARGB(60, 255, 255, 255),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Joan Smalls",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Joan Smalls is a Puerto Rican model and actress.  In 2013, she entered Forbes magazine's \"World's Highest-Paid Models\" list for the first time, ranking at number eight with over \$3 million in earnings.",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ]),
                    ))
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  void initStatusBar() {}
}
