import 'package:flutter/material.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_model.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_status_count.dart';
import 'package:task_manager_app_with_api/task_manager/data/service/api_caller.dart';
import 'package:task_manager_app_with_api/task_manager/utils/urls.dart';
import 'package:task_manager_app_with_api/task_manager/widget/task_card.dart';
import 'package:task_manager_app_with_api/task_manager/widget/task_count_by_status.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  List<TaskStatusCountModel>taskCountList = [];
  List<TaskModel>taskList = [];

  Future<void>getAllTaskCount() async {
    final response = await ApiCaller.getRequest(URL: TMUrls.taskStatusCountURL);

    List<TaskStatusCountModel>temList = [];

    if(response.isSuccess){
      for(Map<String, dynamic>jsonData in response.responseData['data']){
        temList.add(TaskStatusCountModel.fromJson(jsonData));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong....???')));
    }

    taskCountList = temList;

    setState(() {

    });
  }

  Future<void>getAllTask() async {
    final response = await ApiCaller.getRequest(URL: TMUrls.AllTaskURL('New'));

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
    getAllTaskCount();
    getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(

        children: [
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: taskCountList.length,
              itemBuilder: (context, index){
                  return SizedBox(
                      width: 100,
                      child: TaskCountByStatus(
                        title: taskCountList[index].sId.toString(),
                        count: taskCountList[index].sum ?? 0,));
                },
              separatorBuilder: (context, index){
                  return SizedBox(width: 5,);
                },
            ),
          ),

          Expanded(
            child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index){
              return TaskCard(taskModel: taskList[index], cardColor: Colors.blue, refreshParent: () {  },
              );
            }),
          ),

        ],

      ),
    );
  }
}


