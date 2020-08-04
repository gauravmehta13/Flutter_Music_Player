import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/rendering.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Music Player',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MainPage(),
    routes: <String, WidgetBuilder>{
      '/Youtube': (BuildContext context) => new Youtube(),
      '/JioSaavn': (BuildContext context) => new JioSaavn(),
      '/Wynk': (BuildContext context) => new Wynk(),
      '/Gaana': (BuildContext context) => new Gaana(),
    },
  ));
}

class MainPage extends StatefulWidget {
  HomePage createState() => HomePage();
}

// ignore: must_be_immutable
class HomePage extends State<MainPage> {
  AudioPlayer _audioplayer = AudioPlayer();
  bool isplaying = false;
  String CurrentTime = "00.00";
  String CompleteTime = "00.00";

  @override
  Widget build(BuildContext context) {
    _audioplayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        CurrentTime = duration.toString().split(".")[0];
      });
    });
    _audioplayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        CompleteTime = duration.toString().split(".")[0];
      });
    });
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.mic,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              )),
        ],
        backgroundColor: Colors.black,
        title: Text('Retro Music'),
        centerTitle: false,
      ),
      body: Stack(
        children: <Widget>[
          //had to change loop count of gif from "https://ezgif.com/loop-count"
          Image.asset("assets/music.gif"),
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 150.0,
                minHeight: 70,
                maxWidth: double.infinity,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              margin: EdgeInsets.symmetric(),
              //color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                      color: Colors.blue,
                      icon: Icon(isplaying ? Icons.pause : Icons.play_arrow),
                      onPressed: () {
                        if (isplaying) {
                          _audioplayer.pause();
                          setState(() {
                            isplaying = false;
                          });
                        } else {
                          _audioplayer.resume();
                          setState(() {
                            isplaying = true;
                          });
                        }
                      }),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                      color: Colors.blue,
                      icon: Icon(Icons.stop),
                      onPressed: () {
                        _audioplayer.stop();
                        setState(() {
                          isplaying = false;
                        });
                      }),
                  Text(
                    CurrentTime,
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.blue),
                  ),
                  Text(" | "),
                  Text(
                    CompleteTime,
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.blue),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), title: Text('Home')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.library_music), title: Text('Songs')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.album), title: Text('Albums')),
                    //BottomNavigationBarItem(
                    //icon: Icon(Icons.art_track), title: Text('Artists')),
                    //BottomNavigationBarItem(
                    //  icon: Icon(Icons.favorite), title: Text('Playlists')),
                  ],
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.white,
                  backgroundColor: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        // padding: EdgeInsets.only(bottom: 100.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0.15, 0.4),
              child: FloatingActionButton.extended(
                onPressed: () async {
                  String filepath = await FilePicker.getFilePath();
                  int status = await _audioplayer.play(filepath, isLocal: true);
                  if (status == 1) {
                    setState(() {
                      isplaying = true;
                    });
                  }
                },
                icon: Icon(Icons.music_note),
                heroTag: "Local",
                label: Text("Choose Song to Play"),
              ),
            ),
            Align(
              alignment: Alignment(1.1, 0.7),
              child: FloatingActionButton.extended(
                onPressed: () => Navigator.of(context).pushNamed('/Gaana'),
                icon: new Image.asset(
                  'assets/icons/gaana.png',
                  width: 60,
                ),
                label: Text(""),
                heroTag: "Gaana",
              ),
            ),
            Align(
              alignment: Alignment(0.478, 0.7),
              child: FloatingActionButton.extended(
                onPressed: () => Navigator.of(context).pushNamed('/Wynk'),
                icon: new Image.asset(
                  'assets/icons/wynk.png',
                  width: 80,
                ),
                heroTag: "Wynk",
                label: Text(""),
              ),
            ),
            Align(
              alignment: Alignment(-0.27, 0.7),
              child: FloatingActionButton.extended(
                  onPressed: () => Navigator.of(context).pushNamed('/JioSaavn'),
                  icon: new Image.asset(
                    'assets/icons/saavn1.png',
                    width: 80,
                  ),
                  label: Text(""),
                  heroTag: "Saavn"),
            ),
            Align(
              alignment: Alignment(-0.9, 0.7),
              child: FloatingActionButton.extended(
                onPressed: () => Navigator.of(context).pushNamed('/Youtube'),
                icon: new Image.asset(
                  'assets/icons/yt.png',
                  width: 60,
                ),
                label: Text(""),
                heroTag: "Yt Music",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Youtube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.black,
        ),
      ),
      body: const WebView(
        initialUrl: 'https://music.youtube.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class Wynk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.redAccent,
        ),
      ),
      body: const WebView(
        initialUrl: 'https://wynk.in/music',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class JioSaavn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.greenAccent,
        ),
      ),
      body: const WebView(
        initialUrl: 'https://www.jiosaavn.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class Gaana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.redAccent,
        ),
      ),
      body: const WebView(
        initialUrl: 'https://gaana.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
