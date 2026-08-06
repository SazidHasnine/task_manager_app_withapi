import 'package:flutter/material.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_model.dart';
import 'package:task_manager_app_with_api/task_manager/widget/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
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
              status: 'Completed',
            ), cardColor: Colors.green, refreshParent: () {  },
            );
          }),
    );
  }
}
