import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:core';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ToDo List',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _moviesList = [
    {
      "id": "1",
      "picture": "lib/assets/pic1.jpg",
      "title": "Star Wars IV",
      "category": "Action",
      "time": "2h 5m",
      "isFavorite": false
    },
    {
      "id": "2",
      "picture": "lib/assets/pic2.jpg",
      "title": "Perdi Meu Corpo",
      "category": "Animation/Fantasy",
      "time": "1h 21m",
      "isFavorite": false
    },
    {
      "id": "3",
      "picture": "lib/assets/pic3.jpg",
      "title": "1917",
      "category": "War/Drama",
      "time": "1h 59m",
      "isFavorite": false
    },
    {
      "id": "4",
      "picture": "lib/assets/pic4.jpg",
      "title": "The Great Hack",
      "category": "Documentary",
      "time": "2h 19m",
      "isFavorite": false
    },
  ];

  bool showFavorite = false;
  bool showRelease = true;

  void _addMovieToFavorite(index) { 
      setState(() {
        _moviesList[index]["isFavorite"] = true;
      }); 
  }

  void _deleteMovieFromFavorite(index) {
    setState(() {
     _moviesList[index]["isFavorite"] = false;
    });
  }

  void _showFavorites(){
    setState(() {
      showFavorite = true;
      showRelease = false;
    });
  }

  void _showReleases(){
    setState(() {
      showFavorite = false;
      showRelease = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),

      appBar: AppBar(
        title: Text("My Movie List"),
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
        centerTitle: true
      ),

      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(itemCount: _moviesList.length, itemBuilder: (context, index) {
                return Container(
                  key: ValueKey(index),
                  width: 250,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  margin: const EdgeInsets.only(left: 10.0, bottom: 15.0, right: 10.0),
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(45,45,45,1)),
                  child: showRelease ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Image(image: AssetImage(_moviesList[index]["picture"]), width: 90, height: 180),
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: <Widget>[

                            Text(_moviesList[index]["title"], style: TextStyle(color: Color.fromRGBO(255,255,255,1), fontSize: 24)),
                            Text(_moviesList[index]["category"], style: TextStyle(color: Color.fromRGBO(255,255,255,1),fontSize: 14)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.access_time, color: Color.fromRGBO(255,255,255,1)),
                                Text(_moviesList[index]["time"], style: TextStyle(color: Color.fromRGBO(255,255,255,1),fontSize: 14))
                              ]
                            ),
                          ],
                        ),

                        /*crossAxisAlignment: CrossAxisAlignment.start,*/
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              icon: _moviesList[index]["isFavorite"] ? Icon(Icons.cancel, color: Colors.red) : Icon(Icons.star, color: Colors.yellow), 
                              onPressed: _moviesList[index]["isFavorite"] ? () => _deleteMovieFromFavorite(index) : () => _addMovieToFavorite(index)
                            ),
                          ],
                        ),
                        
                      ]
                    ) : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _moviesList[index]["isFavorite"] ? <Widget> [

                        Image(image: AssetImage(_moviesList[index]["picture"]), width: 90, height: 180),
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: <Widget>[

                            Text(_moviesList[index]["title"], style: TextStyle(color: Color.fromRGBO(255,255,255,1), fontSize: 24)),
                            Text(_moviesList[index]["category"], style: TextStyle(color: Color.fromRGBO(255,255,255,1),fontSize: 14)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.access_time, color: Color.fromRGBO(255,255,255,1)),
                                Text(_moviesList[index]["time"], style: TextStyle(color: Color.fromRGBO(255,255,255,1),fontSize: 14))
                              ]
                            ),
                          ],
                        ),

                        /*crossAxisAlignment: CrossAxisAlignment.start,*/
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              icon: _moviesList[index]["isFavorite"] ? Icon(Icons.cancel, color: Colors.red) : Icon(Icons.star, color: Colors.yellow), 
                              onPressed: _moviesList[index]["isFavorite"] ? () => _deleteMovieFromFavorite(index) : () => _addMovieToFavorite(index)
                            ),
                          ],
                        )
                        
                      ] : <Widget> [

                      ]
                    ),//Row //Row 
                  );//Container
              })
            ), //Expanded

            Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        onPressed: _showReleases,
                        color: showRelease ?Color.fromRGBO(45,45,45,1) : Color.fromRGBO(25,25,25,1),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.fromLTRB(50.0, 18, 50, 18),
                        splashColor: Color.fromRGBO(30,30,30,1),
                        child: Text('Releases', style: TextStyle(fontSize: 18)),
                      ),
                      FlatButton(
                        onPressed: _showFavorites,
                        color: showFavorite ? Color.fromRGBO(45,45,45,1) : Color.fromRGBO(25,25,25,1),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.fromLTRB(50.0, 18, 50, 18),
                        splashColor: Color.fromRGBO(30,30,30,1),
                        child: Text('Favorites', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
              ),
        ],//children Column
      ),//Column
    );
  }
}
