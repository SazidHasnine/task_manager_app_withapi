import 'package:flutter/material.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_model.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_status_count.dart';
import 'package:task_manager_app_with_api/task_manager/data/service/api_caller.dart';
import 'package:task_manager_app_with_api/task_manager/utils/urls.dart';

class TaskProvider with ChangeNotifier {

  bool isLoading = false;
  String ? errorMessage;

  void setLoading(bool value){
    isLoading = value;
    notifyListeners();
  }

  List<TaskStatusCountModel> taskCountList = [];

  List<TaskModel> newTask = [];
  List<TaskModel> progressTask = [];
  List<TaskModel> completedTask = [];
  List<TaskModel> cancelledTask = [];

  Future<void>getAllTaskCount() async {
    setLoading(true);

    final response = await ApiCaller.getRequest(URL: TMUrls.taskStatusCountURL);

    List<TaskStatusCountModel>temList = [];

    if(response.isSuccess){
      for(Map<String, dynamic>jsonData in response.responseData['data']){
        temList.add(TaskStatusCountModel.fromJson(jsonData));
      }
    }else{
      // vacant for now
    }

    taskCountList = temList;

    setLoading(false);
  }

}