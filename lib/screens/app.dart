import 'package:bonk_music/screens/home.dart';
import 'package:bonk_music/screens/search.dart';
import 'package:bonk_music/screens/yourlibrary.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  get icon => null;

  // ignore: non_constant_identifier_names
  final Tabs = [const Home(), const Search(), const YourLibrary()];
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor:Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (currentIndex){
          currentTabIndex = currentIndex;
          setState(() {
            
          });
        },
        selectedLabelStyle: const TextStyle(color: Colors.white),
        selectedItemColor: Colors.white, 
        backgroundColor: Colors.black45,
        items: 
      const [        
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white),label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.white),label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.library_music, color: Colors.white),label: 'Your Library'),
      ],),
    );
  }
}