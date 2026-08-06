import 'package:flutter/material.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_model.dart';
import 'package:task_manager_app_with_api/task_manager/widget/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
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
              status: 'Progress',
            ), cardColor: Colors.purple, refreshParent: () {  },
            );
          }),
    );
  }
}
