import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AudioPlayer _audioplayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
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
              /* Container(
              height: 50,
              width: double.infinity,
              color: Colors.blueGrey,
              //icon: Icon(CustomIcons.heart)
            ),*/
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
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            _audioplayer.resume();
                          }),
                      SizedBox(
                        width: 50,
                      ),
                      IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.stop),
                          onPressed: () {
                            _audioplayer.stop();
                          }),
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
                            icon: Icon(Icons.library_music),
                            title: Text('Songs')),
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
            padding: EdgeInsets.only(bottom: 100.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton.extended(
                onPressed: () async {
                  String filepath = await FilePicker.getFilePath();
                  _audioplayer.play(filepath, isLocal: true);
                },
                icon: Icon(Icons.music_note),
                label: Text("Choose Song to Play"),
              ),
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
