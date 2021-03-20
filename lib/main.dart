import 'package:design_1/DetailScreen.dart';
import 'package:design_1/ModelGirl.dart';
import 'package:design_1/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(textStyle: TextStyle())),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ModelGirl> models = [
    ModelGirl(
        url:
            "https://m.media-amazon.com/images/M/MV5BMTM5MjIyMzIyNl5BMl5BanBnXkFtZTcwNzg5ODQ1OQ@@._V1_.jpg",
        name: "Joan Smalls",
        city: "New York"),
    ModelGirl(
        url:
            "https://i.pinimg.com/564x/3c/14/5f/3c145ffff3d07ee0dd7aa6fb9713860b.jpg",
        name: "Trisha Louis",
        city: "London"),
    ModelGirl(
        url:
            "https://i.pinimg.com/originals/a8/1b/7b/a81b7bcf5932a9b2fc80e2094305843f.jpg",
        name: "Mia Taylor",
        city: "New York"),
    ModelGirl(
        url:
            "https://t4.ftcdn.net/jpg/02/49/74/67/360_F_249746779_wGEZAEFQrNlmzAaHssjyBtecv261O16A.jpg",
        name: "Beatrice Smith",
        city: "Paris"),
    ModelGirl(
        url:
            "https://i.pinimg.com/originals/2c/8f/ff/2c8fffdbc5c8aa3e4476ab816eadacd9.jpg",
        name: "Isabel Wilson",
        city: "Paris"),
    ModelGirl(
        url:
            "https://image.freepik.com/free-photo/portrait-young-asian-woman-studio-with-red-blue-neon-lights_182527-844.jpg",
        name: "Isabel Wilson",
        city: "Paris"),
  ];

  int likesCount = 579;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {},
                      child: Container(
                          width: 45,
                          height: 45,
                          padding: const EdgeInsets.all(10),
                          child:  SvgPicture.asset(
                            "assets/icons/menu.svg",
                            color: Colors.black,
                          )),
                    ),
                    InkWell(
                      borderRadius:  BorderRadius.circular(25),
                      onTap: () {},
                      child: Container(
                          width: 45,
                          height: 45,
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            "assets/icons/search.svg",
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Fashion Week",
                    style: TextStyle(
                        color: accentColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "2021 Fashion show in Paris",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w300),
                  ),
                ]),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SvgPicture.asset(
                      "assets/icons/menu.svg",
                      color: Colors.black,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended",
                      style: TextStyle(
                          color: accentColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "New Models",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "2020 Show",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Wrap(children: [
                  GridView.builder(
                    padding: EdgeInsets.only(bottom: 0),
                    shrinkWrap: true,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.6),
                    itemCount: models.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkResponse(
                        child: models[index],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        imgUrl: models[index].url,
                                      )));
                        },
                      );
                    },
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
