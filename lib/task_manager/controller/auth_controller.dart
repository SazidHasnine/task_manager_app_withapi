import 'dart:convert';

import 'package:task_manager_app_with_api/task_manager/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String ? token;
  static UserModel ? userData;

  static Future saveUserData(UserModel model, String token) async{                      //tkn
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString('token', token);                                        //tkn
    sharedPreferences.setString('user-data', jsonEncode(model.toString()));

    AuthController.token = token;                                                       //token = tkn
    userData = model;

  }

  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String ? tkn = sharedPreferences.getString('token');
    if(tkn != null){
      token = tkn;
    }

    String ? uData = sharedPreferences.getString('user-data');
    if(uData != null){
      userData = UserModel.fromJson(jsonDecode(uData));
    }

  }

  static Future<bool> isUserLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String ? tkn = sharedPreferences.getString('token');

    return tkn != null;

    // if(tkn != null){
    //   return true;
    // }else{
    //   return false;
    // }

  }

}