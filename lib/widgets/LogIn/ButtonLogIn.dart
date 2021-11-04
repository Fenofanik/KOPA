import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/services/Firebase_services.dart';
import 'package:kopamain/widgets/LogIn/Verification.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'google.dart';

class ButtonLogIn extends StatefulWidget {
  @override
  ButtonLogInState createState() => ButtonLogInState();
}

class ButtonLogInState extends State<ButtonLogIn> {
  String firstName='',secondName='',image,email='';
  int showTextField = 1;
  bool showLoading = false;
  FirebaseServices firebaseServices = FirebaseServices();
  FirebaseAuth _auth = FirebaseAuth.instance;
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  String messageABOBA = 'Вхід/Вихід по натисканню кнопки.';

  Future<Null> login() async {

    final FacebookLoginResult result =
    await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,picture,email&access_token=${accessToken.token}'));
        final profile = jsonDecode(graphResponse.body);
        setState(() async {
          firstName = profile['first_name'];
          secondName = profile['last_name'];
          image = profile['picture']['data']['url'];
          email = profile['email'];
          final facebookAuthCredential = FacebookAuthProvider.credential(token);
          FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
          final faceBookAuthCredential = await _auth.signInWithCredential(facebookAuthCredential).then((
              result) {
            String userName = firstName;
            String faceBookId = result.user.uid;
            String email = result.user.email;
            String faceBookImg = result.user.photoURL;
            List<String> favs=[];
            firebaseServices.userRef.doc(faceBookId).set({
              "id": faceBookId,
              "name":userName,
              "favs":favs,
              "phoneNumber": email,
              "imageUrl":faceBookImg,

            });

          });
          if(faceBookAuthCredential?.user==null){
            Navigator.pushNamed(context, '/Verification3');
          }else{
            Navigator.pushNamed(context, '/Home');
          }
        });
        _showMessage('''
         Вхід!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Логін відмінений юзером.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Щось пішло не так.\n'
            'Ось\'яку помилку Facebook дає нам: ${result.errorMessage}');
        break;
    }
  }
  void _showMessage(String message) {
    setState(() {
      messageABOBA = message;
    });
  }
  FirebaseAuth auth;
  User user;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    user = auth.currentUser;
    isLoading = false;

  }

  @override
  Widget build(BuildContext context) {
    return showTextField == 1
        ? Padding(padding: const EdgeInsets.only(bottom: 30),
        child :
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ThemeManager.phoneButton),
                    child: IconButton(
                      iconSize: 25.0,
                      onPressed: () {
                        setState(() {
                          showTextField = 2;
                        });
                      },
                      icon: Icon(Icons.phone, color: ThemeManager.whiteThings),
                    )),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ThemeManager.faceBookButton),
                    child: IconButton(
                        color: ThemeManager.whiteThings,
                        iconSize: 25.0,
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom:2,left: 1),
                          child: new Center(
                              child: new Icon(FontAwesomeIcons.facebook)),
                        ),
                        alignment: Alignment.center,
                        onPressed: (){
                          login();
                        })),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ThemeManager.googleButton),
                    child: IconButton(
                        color: ThemeManager.whiteThings,
                        iconSize: 25.0,
                        icon: Center(child: new Icon(FontAwesomeIcons.google)),
                        alignment: Alignment.center,
                        onPressed: () async{
                          final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                          await provider.googleLogIn();
                              await Navigator.pushNamed(context, '/Verification3');
                        }))
              ])
    )
        : Verification();
  }

}
