import 'package:flutter/material.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_model.dart';

class TaskCard extends StatefulWidget {
  final TaskModel taskModel;
  final Color cardColor;
  final VoidCallback refreshParent;

  const TaskCard({
    super.key, required this.taskModel, required this.cardColor, required this.refreshParent,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Text(widget.taskModel.title.toString(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18,),
          ),

          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.taskModel.description.toString()),
              SizedBox(height: 5,),
              Text('Date: ${widget.taskModel.createdDate}', style: TextStyle(fontWeight: FontWeight.w500),),
              Row(
                children: [
                  Chip(
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    label: Text(' ${widget.taskModel.status} '),
                    backgroundColor: widget.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),

                  Spacer(),

                  IconButton(onPressed: (){}, icon: Icon(Icons.edit_note, color: Colors.orange,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,)),
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}