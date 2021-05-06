import 'package:flutter/material.dart';

class FavoritesScreenMain extends StatefulWidget {
  @override
  FavoritesScreenMainState createState() => FavoritesScreenMainState();
}

class FavoritesScreenMainState extends State<FavoritesScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TextFormField(

        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
    );
  }
}