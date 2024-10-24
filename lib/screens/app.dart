import 'package:bonk_music/models/music.dart';
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

  Music? music;
  Widget miniPlayer(Music? music){
    if(music == null){
      return SizedBox();
    }
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(duration: const Duration(milliseconds: 300),
     color: Colors.blueGrey,
     width: deviceSize.width,
     height: 50,
     child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Image.network(music.image,fit: BoxFit.cover,),
      Text(music.name, style: TextStyle(color: Colors.white),),
      IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow, color: Colors.white,))
     ],
      ),
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor:Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          BottomNavigationBar(
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
        ],
      ),
    );
  }
}