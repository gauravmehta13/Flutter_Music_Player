import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/video.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBottomNavigationBar(),
      routes: <String, WidgetBuilder>{
        '/Youtube': (BuildContext context) => new Youtube(),
        '/JioSaavn': (BuildContext context) => new JioSaavn(),
        '/Wynk': (BuildContext context) => new Wynk(),
        '/Gaana': (BuildContext context) => new Gaana(),
      },
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentindex = 0;
  final List<Widget> _children = [HomePage(), Video()];
  void onTappedBar(int newindex) {
    setState(() {
      _currentindex = newindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: _children[_currentindex],
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blue,
          backgroundColor: Colors.black,
          height: 50,
          items: <Widget>[
            Icon(Icons.home, size: 20, color: Colors.white),
            Icon(Icons.video_call, size: 20, color: Colors.white),
            Icon(Icons.album, size: 20, color: Colors.white),
          ],
          animationDuration: Duration(milliseconds: 600),
          animationCurve: Curves.fastOutSlowIn,
          onTap: onTappedBar,
          index: _currentindex,
        ));
  }
}
