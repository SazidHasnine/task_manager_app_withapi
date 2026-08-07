import 'package:flutter/material.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_model.dart';
import 'package:task_manager_app_with_api/task_manager/data/service/api_caller.dart';
import 'package:task_manager_app_with_api/task_manager/utils/urls.dart';
import 'package:task_manager_app_with_api/task_manager/widget/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  List<TaskModel>taskList = [];
  Future<void>getAllTask() async {
    final response = await ApiCaller.getRequest(URL: TMUrls.AllTaskURL('Progress'));

    List<TaskModel>temList = [];

    if(response.isSuccess){
      for(Map<String, dynamic>jsonData in response.responseData['data']){
        temList.add(TaskModel.fromJson(jsonData));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong....???')));
    }

    taskList = temList;

    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index){
            return TaskCard(taskModel: taskList[index], cardColor: Colors.blue, refreshParent: () {
              getAllTask();
            },
            );
          }),
    );
  }
}
