import 'package:flutter/widgets.dart';
import 'package:task_manager_app_with_api/task_manager/controller/auth_controller.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/api_response.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/user_model.dart';
import 'package:task_manager_app_with_api/task_manager/data/service/api_caller.dart';
import 'package:task_manager_app_with_api/task_manager/utils/urls.dart';

class AuthProvider extends ChangeNotifier {

  bool isLoading = false;
  String ? errorMessage;

  void setLoading(bool value){
    isLoading = value;
    notifyListeners();
  }

  Future<bool> login({
    required String email,
    required String password }) async {

    setLoading(true);

    final ApiResponse response = await ApiCaller.postRequest(URL: TMUrls.LoginURL,
      body: {
        "email": email,
        "password": password
      },
    );

    setLoading(false);

    if(response.isSuccess){
      UserModel model = UserModel.fromJson(response.responseData['data']);
      String token = response.responseData['token'];

      AuthController.saveUserData(model, token);

      return true;

    }else{
      return false;
    }
  }

  Future<bool> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String mobile,
    required String password }) async {

    setLoading(true);

    final ApiResponse response = await ApiCaller.postRequest(URL: TMUrls.SignupURL,
      body: {
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "mobile": mobile,
        "password": password
      },
    );

    setLoading(false);

    if(response.isSuccess){
      return true;
    }else{
      return false;
    }
  }

}