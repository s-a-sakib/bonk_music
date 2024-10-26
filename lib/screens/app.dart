import 'package:audioplayers/audioplayers.dart';
import 'package:bonk_music/models/music.dart';
import 'package:bonk_music/screens/home.dart';
import 'package:bonk_music/screens/search.dart';
import 'package:bonk_music/screens/yourlibrary.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false; // Track if the music is playing or not
  var Tabs = []; // Declare the Tabs list
  int currentTabIndex = 0; // Set initial index to Home tab

  Music? music;

  // Mini player widget
  Widget miniPlayer(Music? music) {
    this.music = music;
    setState(() {}); // Update the UI when the song is changed

    if (music == null) {
      return const SizedBox();
    }

    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: Colors.blueGrey,
      width: deviceSize.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            music.image,
            fit: BoxFit.cover,
          ),
          Text(
            music.name,
            style: const TextStyle(color: Colors.white),
          ),
          IconButton(
            onPressed: () async {
              // Toggle play/pause state
              if (isPlaying) {
                await _audioPlayer.pause(); // Pause if playing
              } else {
                await _audioPlayer.play(UrlSource(music.audioURL)); // Play if not playing
              }
              setState(() {
                isPlaying = !isPlaying; // Toggle play state
              });
            },
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow, // Toggle between play and pause icons
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Pass miniPlayer function to Home and ensure Tabs is initialized
    Tabs = [Home(miniPlayer), Search(), YourLibrary()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music), // Display mini player
          BottomNavigationBar(
            currentIndex: currentTabIndex, // Highlight the current tab
            onTap: (currentIndex) {
              setState(() {
                currentTabIndex = currentIndex; // Update tab index
              });
            },
            selectedLabelStyle: const TextStyle(color: Colors.white),
            selectedItemColor: Colors.white,
            backgroundColor: Colors.black45,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.white),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music, color: Colors.white),
                label: 'Your Library',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
