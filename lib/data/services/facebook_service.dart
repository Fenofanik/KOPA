import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:kopamain/domain/models/user_model.dart';

class FaceBookService{
  Future<UserModel> signIn(accessToken) async {
    try {
      final urlString =
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,picture,email&access_token=$accessToken';
      final Uri url = Uri.parse(urlString);
      final response = await http.get(url);

      if (response.statusCode != 200) {
        print(response.statusCode);
        print(response.request);
        print(response.body);
      }
      if (response.statusCode == 200) {
        final facebookAuthCredential = FacebookAuthProvider.credential(accessToken);
        // FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
        var result = json.decode(response.body);
        var userModel = UserModel.fromSnapshot(result);
        return userModel;

      }
    } catch (e) {
      print('Error');
      print(e);
    }
    return UserModel();
  }
}


