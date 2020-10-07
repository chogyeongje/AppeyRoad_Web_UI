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
        body: Stack(
          children: [
            // TODO : 뒤에 배경 이미지
            Container(
              decoration: BoxDecoration(
                image:
                DecorationImage(image: AssetImage('images/background.jpg'), fit: BoxFit.cover),
              ),
            ),
            // TODO : 배경 이미지 어둡게 하기
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            Column(
              children: [
                // TODO : 화면 최상단 버튼들
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                  child: Row(
                    children: [
                      // TODO : 아이콘
                      ClipOval(
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.airplanemode_active,
                            color: Colors.black45,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'Travelography', style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      // TODO : 오른쪽 메뉴 버튼들
                      Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlatButton(
                                child: Text(
                                  'Trips', style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                              FlatButton(
                                child: Text(
                                  'Blog', style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                              FlatButton(
                                child: Text(
                                  'Contact', style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          )
                      )
                    ],
                  ),
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
                              'SUBSCRIBE',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
    );
  }
}
