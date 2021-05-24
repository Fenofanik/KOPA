
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kopamain/AppColors/Colors_app.dart';

class UserCreate extends StatefulWidget {

  @override
  _UserCreateState createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {
  final double radius = 7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.background,
      body: Container(
        height:  MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: userCreateUI(context),
      ),
      appBar: AppBar(
        backgroundColor: ThemeManager.background,
        actions: [
          TextButton(onPressed: null, child: Text("Зберегти",style: TextStyle(fontSize: 10,color: Colors.blue),))
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 14,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
  Widget userCreateUI(BuildContext context){
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        child: Column(children:<Widget> [
          Expanded(
            flex: 3,
            child: Container(color: Color(0xff343434),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: [
                  Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),color: Colors.blue,),
                  Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),color: Colors.white,),
                  Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),color: Colors.white,),
                  Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),color: Colors.white,),
                  Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),color: Colors.white,),
                  Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),color: Colors.white,),
                  Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),color: Colors.white,),
                  Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),color: Colors.white,),

                ],
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(color: ThemeManager.background,
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                    child: TextField(decoration: InputDecoration(
                      labelText: "Розмір",
                      labelStyle: TextStyle(fontSize: 14,color: Colors.white),
                      prefixIcon: Icon(Icons.circle,size: 9,color: Colors.blue,),),
                        style: TextStyle(
                            fontSize: (14), color: Colors.white),),),
                  ],),
                  Expanded(
                    child: Container(color: Color(0xff343434),
                      height:  MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,

                      child: Column(children:<Widget> [
                         Expanded(
                           child: Row(children: <Widget>[
                              Expanded(
                                child: Padding(padding: EdgeInsets.all(15),
                                  child: Container(height: MediaQuery.of(context).size.height/4,
                                      child: Image.asset( "assets/images/Kek.png")),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:<Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:<Widget> [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Розмір      EU",style: TextStyle(fontSize: 10,color: Colors.white),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("39",style: TextStyle(fontSize: 10,color: Colors.white),),
                                    ),
                                  ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:<Widget> [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Довжина/см",style: TextStyle(fontSize: 10,color: Colors.white),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("39",style: TextStyle(fontSize: 10,color: Colors.white),),
                                    ),
                                  ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:<Widget> [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Ширина/см",style: TextStyle(fontSize: 10,color: Colors.white),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("10,5",style: TextStyle(fontSize: 10,color: Colors.white),),
                                    ),
                                  ],)
                                ],),
                              )

                            ],),
                         ),

                      ],),
                    ),
                  ),
              ],
            ),


          )),
          Expanded(child: Container(color: ThemeManager.background,
            child: Row(children: <Widget>[
              Expanded (child:TextField(decoration: InputDecoration(
                labelText: "Модель",
                labelStyle: TextStyle(fontSize: 14,color: Colors.white),
                prefixIcon: Icon(Icons.circle,size: 9,color: Colors.blue,),),
                  style: TextStyle(
                      fontSize: (14), color: Colors.white)
              ),)],),
          )),
          Expanded(child: Container(color: ThemeManager.background,
            child: Row(children: <Widget>[
              Expanded (child:TextField(decoration: InputDecoration(
                labelText: "Матеріал",
                labelStyle: TextStyle(fontSize: 14,color: Colors.white),
                prefixIcon: Icon(Icons.circle,size: 9,color: Colors.blue,),),
                  style: TextStyle(
                      fontSize: (14), color: Colors.white)
              ),),
            ],),
          )),
          Expanded(child: Container(color: ThemeManager.background,
            child: Row(children: <Widget>[
              Expanded (child:TextField(decoration: InputDecoration(
                labelText: "Опис",
                labelStyle: TextStyle(fontSize: 14,color: Colors.white),
                prefixIcon: Icon(Icons.circle,size: 9,color: Colors.blue,),),
                  style: TextStyle(
                      fontSize: (14), color: Colors.white)
              ),)],),
          )),
          Expanded(child: Container(color: Color(0xff343434),
            child: Row(children: <Widget>[
              Expanded (child:TextField(decoration: InputDecoration(
                labelText: "Ціна",
                labelStyle: TextStyle(fontSize: 14,color: Colors.white),
                prefixIcon: Icon(Icons.circle,size: 9,color: Colors.blue,),),
                  style: TextStyle(
                      fontSize: (14), color: Colors.white)
              ),)],),
          )),
        ],),
      ),
    );
  }
}
