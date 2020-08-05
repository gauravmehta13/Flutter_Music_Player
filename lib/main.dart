import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/ui/video.dart';
import 'ui/audio.dart';
import 'ui/home.dart';
import 'ui/video.dart';
import 'ui/video.dart';

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
        '/Tubitv': (BuildContext context) => new Tubitv(),
        '/JioCinema': (BuildContext context) => new JioCinema(),
        '/Youtube': (BuildContext context) => new YouTube(),
        '/MxPlayer': (BuildContext context) => new MxPlayer(),
        '/YtMusic': (BuildContext context) => new YtMusic(),
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
  final List<Widget> _children = [
    //HomePage(),
    Audio(),
    Video(),
  ];
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
          color: Colors.red,
          backgroundColor: Colors.black,
          height: 50,
          items: <Widget>[
            // Icon(Icons.home, size: 20, color: Colors.white),
            Icon(Icons.music_note, size: 20, color: Colors.white),
            Icon(Icons.ondemand_video, size: 20, color: Colors.white),
          ],
          animationDuration: Duration(milliseconds: 500),
          animationCurve: Curves.fastOutSlowIn,
          onTap: onTappedBar,
          index: _currentindex,
        ));
  }
}
