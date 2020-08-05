import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stream Online "),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              new GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/Youtube'),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image:
                                AssetImage('assets/icons/youtube-banner.png'),
                            fit: BoxFit.cover)),
                  )),
              Container(
                height: 10,
              ),
              new GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/MxPlayer'),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/mx-player.jpg'),
                            fit: BoxFit.cover)),
                  )),
              Container(
                height: 10,
              ),
              new GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/JioCinema'),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/jiocinema.png'),
                            fit: BoxFit.cover)),
                  )),
              Container(
                height: 10,
              ),
              new GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/Tubitv'),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/tubi.png'),
                            fit: BoxFit.cover)),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}

class YouTube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.black,
        ),
      ),
      body: WebView(
        initialUrl: 'https://www.youtube.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class MxPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: WebView(
        initialUrl: 'https://www.mxplayer.in/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class JioCinema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // here the desired height
        child: AppBar(
          backgroundColor: const Color(0xFF800020),
        ),
      ),
      body: WebView(
        initialUrl: 'https://www.jiocinema.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class Tubitv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.black,
        ),
      ),
      body: WebView(
        initialUrl: 'https://tubitv.com/home',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
