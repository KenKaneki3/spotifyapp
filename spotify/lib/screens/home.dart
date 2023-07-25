// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:spotify/models/category.dart';
import 'package:spotify/models/music.dart';
import 'package:spotify/services/category_operetions.dart';
import 'package:spotify/services/music_operations.dart';

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);
  Function _miniplayer;
  Home(this._miniplayer); // dart constructor short hand

  Widget createCategories(Category category) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(children: [
        Image.network(
          category.imageURL,
          fit: BoxFit.cover,
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              category.name,
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }

  List<Widget> createListOfCategories() {
    List<Category> categoryList =
        categoryOperetions.getCategories(); //data recieve
    List<Widget> categories = categoryList
        //convet data-> widget using map func
        .map((Category category) => createCategories(category))
        .toList();
    return categories;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: InkWell(
              onTap: () {
                _miniplayer(music);
              },
              child: Image.network(
                music.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            music.name,
            style: TextStyle(
                color: Colors.blueGrey.shade100,
                fontWeight: FontWeight.bold,
                fontSize: 17),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width: 167,
            child: Flexible(
              child: Text(
                music.decs,
                style: TextStyle(color: Colors.blueGrey.shade100),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createMusicList(String lable) {
    List<Music> musicList = MusicOperetions.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade100,
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
      height: 230,
      child: GridView.count(
        padding: EdgeInsets.only(right: 7, left: 7),
        childAspectRatio: 6 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListOfCategories(),
        crossAxisCount: 2,
      ),
    );
  }

  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Color.fromARGB(0, 255, 255, 255),
      elevation: 0.0,
      title: Text(message),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 10), child: Icon(Icons.settings))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              createAppBar('Good Morning'),
              SizedBox(
                height: 5,
              ),
              createGrid(),
              createMusicList('Music For You'),
              SizedBox(height: 20),
              createMusicList('Discover Something New')
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(66, 14, 220, 0.578),
                Color.fromRGBO(46, 19, 125, 0.612),
                Colors.black,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.2, 0.35],
            ),
          ),
        ),
      ),
    );
  }
}
