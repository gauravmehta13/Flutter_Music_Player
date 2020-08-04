# Musicplayer
Blog Link : https://medium.com/@gauravmehta13/music-player-built-with-flutter-27310b54d02a?sk=d4d3446827bc94fc98dbeb55c7868fee

## Music Player Built With Flutter

After discovering the Flutter SDK doesn't have support for playing audio / music I searched through all of the available packages which were music related on pub.dev and finalised audioplayers package at last.
dependencies:
  audioplayers: ^0.15.1
import 'package:audioplayers/audioplayers.dart';
Now, Lets make a Material App
Here I used theme for default visual properties, like colors fonts and shapes, for this app's material widgets.
I also used routes which acts as application's top-level routing table. I will discuss more about routes when we will use them.
Here, I used Stateful widget for my homepage because we will use setState function in future which can't be used in stateless widget as its immutable.
An AudioPlayer instance can play a single audio at a time. To create it, simply call the constructor:
AudioPlayer _audioplayer = AudioPlayer();
AppBar
I used a typical AppBar with a title, actions and as i wanted to give the app a dark theme, I mostly used Blue-Black theme in the code.
The padding is used for giving proper space between Appbar icons.
Body
Adding Animated Gif
I used a Gif file to make the UI look more cool.
https://youtu.be/WXQhxW7jdqs
Adding Play / Pause Buttons for music
Playing Audio
There are three possible sources of audio:
Remote file on the Internet
Local file on the user's device
Local asset from your Flutter project

Both for Remote Files or Local Files, use the play method, just setting appropriately the flag isLocal. For Local Assets, you have to use the AudioCache class (see below). To play a Remote File, just call play with the url (the isLocal parameter is false by default)
Here, I used if else command to show different icons when music is playing or paused.
icon: Icon(isplaying ? Icons.pause : Icons.play_arrow),
_audioplayer.pause();
_audioplayer.resume();
Similarly we can configure stop button
_audioplayer.stop();
Also, To display Current and Complete time, we have
_audioplayer.onAudioPositionChanged.listen((Duration duration) {
setState(() {
CurrentTime = duration.toString().split(".")[0];});});
_audioplayer.onDurationChanged.listen((Duration duration) {
setState(() {
CompleteTime = duration.toString().split(".")[0];});});
This gets the song time and displays it beside the buttons.
Getting Songs from Local Storage
I used File picker package as it allows usto use a native file explorer to pick single or multiple absolute file paths, with extensions filtering support.
dependencies:   
     file_picker: ^1.13.0+1
import 'package:file_picker/file_picker.dart';
Here i used a floating button inside a container to get local files.
I used Align widget as i wanted to place the floating button wherever i wanted.
await FilePicker.getFilePath();
As soon as we tap on the button, it opens the local file manager where we can select the song we want to play.
Integrating Online Music services:
I used Android webview to Integrate the following Online Music Streaming platforms inside the app :
Youtube Music
Jio Saavn
Gaana Music
Wynk Music

Disclaimer : I tried this Just for Educational Purposes, without the consent of these platforms. Please take prior consent if you want to add anyone's website in your appWebview.
I used WebView for Flutter package as it provides a WebView widget.
dependencies:
   webview_flutter: ^0.3.22+1
import 'package:webview_flutter/webview_flutter.dart';
First I made different Classes for different Webviews.
javascriptMode : Whether Javascript execution is enabled.
initialUrl : URL which you want to load.

This basic structure is enough to get you started with the WebView widget.
I used similar Floating buttons with custom icons to get access to these webviews.
Adding Custom Icons:
 assets:
- assets/icons/saavn1.png
- assets/icons/wynk.png
Also used custom alignment so that each button will be displayed right next to each other.
here, onPressed navigates to the routes which we created earlier.
And these routes navigates to the different webview classes we just created.
After the code has been built , it is now time to test it :



I am still Updating the App and will Introduce Video Player soon
gauravmehta13/Flutter_Music_Player
A new Flutter project. This project is a starting point for a Flutter application. A few resources to get you started…github.co
If you enjoyed reading the article don't forget to applaud.Peace
