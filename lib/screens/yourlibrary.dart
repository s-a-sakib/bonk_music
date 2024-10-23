import 'package:flutter/material.dart';

class YourLibrary extends StatefulWidget {
  const YourLibrary({super.key});

  @override
  State<YourLibrary> createState() => _YourLibraryState();
}

class _YourLibraryState extends State<YourLibrary> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Text('YourLibrary',style: TextStyle(fontSize: 40 , color: Colors.white),));
  }
}