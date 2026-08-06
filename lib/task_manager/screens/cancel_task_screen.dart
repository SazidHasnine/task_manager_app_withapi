import 'package:flutter/material.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_model.dart';
import 'package:task_manager_app_with_api/task_manager/widget/task_card.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return TaskCard(taskModel: TaskModel(
              title: 'Task Title',
              description: 'Task description goes here. All of the details about the task.',
              createdDate: '20/08/26',
              status: 'Cancelled',
            ), cardColor: Colors.red, refreshParent: () {  },
            );
          }),
    );
  }
}
