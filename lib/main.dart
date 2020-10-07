import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Sample()
    );
  }
}

class Sample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GreyScaleImage(
      imageUrl: 'images/background.jpg',
      opacity: 0.5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
            child: WebAppBar(),
          ),
          Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Need travel Plans",
                        style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Find out what's happening now in a city near you",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                      child: Text(
                        'Yes! Show me the goodies',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Text(
                        'SUBSCRIBE', style: TextStyle(color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}

class WebAppBar extends StatefulWidget {
  @override
  _WebAppBarState createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {

  final List<String> menus = ['Trips', 'Blog', 'Contact'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIcon(
          iconData: Icons.airplanemode_active,
          iconSize: 30,
          padding: 10,
        ),
        SizedBox(width: 10,),
        Text(
          'Travelography', style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (String menu in menus) ...[
                  FlatButton(
                    child: Text(
                      menu,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  )
                ]
              ],
            ))
      ],
    );
  }
}


class GreyScaleImage extends StatelessWidget {
  final String imageUrl;
  final double opacity;
  final Widget child;

  const GreyScaleImage({
    Key key,
    this.imageUrl,
    this.opacity,
    this.child,
  })  : assert(0 <= opacity && opacity <= 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(opacity),
        ),
        child,
      ],
    );
  }
}

class CircleIcon extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final double padding;

  const CircleIcon({Key key, this.iconData, this.iconSize, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(padding),
        child: Icon(
          iconData,
          color: Colors.black45,
          size: iconSize,
        ),
      ),
    );
  }
}
