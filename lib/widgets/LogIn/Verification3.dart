import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/services/Firebase_services.dart';
import 'package:kopamain/widgets/LogIn/ImageLogIn.dart';

class Verification3 extends StatefulWidget {
  @override
  Verification3State createState() => Verification3State();
}

class Verification3State extends State<Verification3> {

  TextEditingController nameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final shape =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ThemeManager.background,
        body: Form(
            key: formKey,
        child:Padding(
        padding: EdgeInsets.only(top : 40,bottom: 30,left: 45,right: 45),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(padding: EdgeInsets.only(top:10),child : ImageLogIn()),
                      Padding(padding: EdgeInsets.only(top:10),child :TextFormField(
                          controller: nameController,
                      maxLength: 20,
                      validator: (String value) {
                        if (value.isEmpty||RegExp('[0-9]').hasMatch(value)) {
                          return "Поле не повинне бути порожнім або містити цифри";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 7),
                        hintText: "Ім'я",
                        hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                        contentPadding: EdgeInsets.only(left: 10),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey[800]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey[800]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      style: TextStyle(fontSize: (14), color: Colors.white))),
                  TextFormField(
                      controller: surNameController,
                      maxLength: 20,
                      validator: (String value) {
                        if (value.isEmpty||RegExp('[0-9]').hasMatch(value)) {
                          return "Поле не повинне бути порожнім або містити цифри";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 7),
                        hintText: "Прізвище",
                        hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                        contentPadding: EdgeInsets.only(left: 10),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey[800]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey[800]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      style: TextStyle(fontSize: (14), color: Colors.white)),
                  TextFormField(
                    controller: cityController,
                      maxLength: 20,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Поле не повинне бути порожнім";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 7),
                        hintText: "Місто",
                        hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                        contentPadding: EdgeInsets.only(left: 10),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey[800]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey[800]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      style: TextStyle(fontSize: (14), color: Colors.white)),
                  Padding(padding:EdgeInsets.only(top:100,bottom: 30,left: 45,right: 45),
                  child :ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: shape,
                        minimumSize: Size(290, 40),
                        primary: Colors.lightBlueAccent,
                      ),
                      child: Text("Готово",
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                      onPressed: () {
                        setState(() {
                          if (formKey.currentState.validate()) {
                            FirebaseServices firebaseServices = FirebaseServices();
                              String _userId = firebaseServices.getUserId();
                              String userPhoneNumber = firebaseServices.getUserPhone();
                            String name = nameController.text;
                            String secondName = surNameController.text;
                            String city = cityController.text;
                            FirebaseFirestore.instance.collection('users').doc(_userId).update({
                              "id":_userId,
                              "phoneNumber" :userPhoneNumber,
                              "name":name,
                              "secondName":secondName,
                              "city":city
                            });

                            Navigator.pushNamed(context, '/Home');
                          }
                        });
                      }))
                ])))));
  }
}
