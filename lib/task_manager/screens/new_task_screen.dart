import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_model.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_status_count.dart';
import 'package:task_manager_app_with_api/task_manager/data/service/api_caller.dart';
import 'package:task_manager_app_with_api/task_manager/providers/task_provider.dart';
import 'package:task_manager_app_with_api/task_manager/utils/urls.dart';
import 'package:task_manager_app_with_api/task_manager/widget/task_card.dart';
import 'package:task_manager_app_with_api/task_manager/widget/task_count_by_status.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  // List<TaskStatusCountModel>taskCountList = [];

  // Future<void>getAllTaskCount() async {
  //   final response = await ApiCaller.getRequest(URL: TMUrls.taskStatusCountURL);
  //
  //   List<TaskStatusCountModel>temList = [];
  //
  //   if(response.isSuccess){
  //     for(Map<String, dynamic>jsonData in response.responseData['data']){
  //       temList.add(TaskStatusCountModel.fromJson(jsonData));
  //     }
  //   }else{
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong....???')));
  //   }
  //
  //   taskCountList = temList;
  //
  //   setState(() {
  //
  //   });
  // }

  List<TaskModel>taskList = [];

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
    // getAllTaskCount();
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    taskProvider.getAllTaskCount();
    getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return Column(

            children: [
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: taskProvider.taskCountList.length,
                  itemBuilder: (context, index){

                      final count = taskProvider.taskCountList[index];

                      return SizedBox(
                          width: 100,
                          child: TaskCountByStatus(
                            title: count.sId.toString(),
                            count: count.sum ?? 0,));
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
                  return TaskCard(taskModel: taskList[index], cardColor: Colors.blue, refreshParent: () {
                    // getAllTaskCount();
                    taskProvider.getAllTaskCount();
                    getAllTask();
                  },
                  );
                }),
              ),

            ],

          );
        }
      ),
    );
  }
}


