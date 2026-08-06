import 'package:flutter/material.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_model.dart';
import 'package:task_manager_app_with_api/task_manager/widget/task_card.dart';
import 'package:task_manager_app_with_api/task_manager/widget/task_count_by_status.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
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
              itemCount: 4,
              itemBuilder: (context, index){
                  return SizedBox(
                      width: 100,
                      child: TaskCountByStatus(title: 'New', count: 23,));
                },
              separatorBuilder: (context, index){
                  return SizedBox(width: 5,);
                },
            ),
          ),

          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index){
              return TaskCard(taskModel: TaskModel(
                title: 'Task Title',
                description: 'Task description goes here. All of the details about the task.',
                createdDate: '20/08/26',
                status: 'New',
              ), cardColor: Colors.blue, refreshParent: () {  },
              );
            }),
          ),

        ],

      ),
    );
  }
}


