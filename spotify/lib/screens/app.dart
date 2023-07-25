// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:spotify/models/music.dart';
import 'package:spotify/screens/home.dart';
import 'package:spotify/screens/search.dart';
import 'package:spotify/screens/yourlibrary.dart';

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  var Tabs = [];
  int currentTabIndex = 0;
 Music? music;
  Widget miniPlayer(Music? music) {
    this.music = music;
    setState(() {});
    if(music == null){
      return SizedBox();
    }
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
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
          style: TextStyle(color: Colors.white),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_arrow_sharp,
              color: Colors.white,
            )),
      ]),
    );
  }
@override
  initState() {
    super.initState();
    Tabs = [Home(miniPlayer), search(), YourLibrary()];
  }
  // ui design code is writen inside built
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (currentIndex) {
              currentTabIndex = currentIndex;
              setState(() {}); // re-rendering
            },
            selectedLabelStyle: TextStyle(color: Colors.white),
            selectedItemColor: Colors.white,
            backgroundColor: Colors.black45,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.white),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_music_outlined, color: Colors.white),
                  label: 'Your Libray')
            ],
          ),
        ],
      ),
    );
  }
}
