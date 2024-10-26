import 'package:bonk_music/models/category.dart';
import 'package:bonk_music/services/category_operations.dart';
import 'package:bonk_music/services/music_operations.dart';
import 'package:flutter/material.dart';
import 'package:bonk_music/models/music.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  Function _miniPlayer;
  Home(this._miniPlayer);

  // Method to create a category widget
  Widget createCategory(Categorye category) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: [
          Image.network(category.imageURL, fit: BoxFit.cover),
          const SizedBox(width: 10), // Add some spacing between image and text
          Text(
            category.name,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Method to create a list of category widgets
  List<Widget> createListOfCategories() {
    List<Categorye> categoryList = CategoryOperations.getCategories(); // Get categories from the service
    return categoryList.map((Categorye category) => createCategory(category)).toList(); // Convert to list of Widgets
  }

  // Method to create a grid of categories
  Widget createGrid() {
    return SizedBox(
      height: 200,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: createListOfCategories(),
      ),
    );
  }

  // Method to create music widget
  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 200,
              width: 200,
              child: InkWell(
                onTap: () {
                  _miniPlayer(music);
                },
                child: Image.network(
                  music.image,
                  fit: BoxFit.cover,
                ),
              )),
          Text(
            music.name,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            music.desc,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  // Method to create a list of music widgets
  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperations.getMusic();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return createMusic(musicList[index]);
            },
            itemCount: musicList.length,
          ),
        ),
      ],
    );
  }

  // Method to create the AppBar
  Widget createAppBar(String? message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        message!,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.settings,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey.shade300, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 0.3],
            ),
          ),
          child: Column(
            children: [
              createAppBar('Good Morning'),
              const SizedBox(height: 5),
              createGrid(), // Display the grid of categories
              createMusicList('Made For You'), // Display "Made For You" list
              createMusicList('Popular music'), // Display "Popular music" list
            ],
          ),
        ),
      ),
    );
  }
}
