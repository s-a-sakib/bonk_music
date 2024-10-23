import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Text('Search',style: TextStyle(fontSize: 40 , color: Colors.white),));
  }
}