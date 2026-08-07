import 'package:flutter/material.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/task_model.dart';
import 'package:task_manager_app_with_api/task_manager/data/service/api_caller.dart';
import 'package:task_manager_app_with_api/task_manager/utils/urls.dart';
import 'package:task_manager_app_with_api/task_manager/widget/snackbar.dart';

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

  Future<void>deleteTask() async {
    final response = await ApiCaller.getRequest(URL: TMUrls.deleteTaskURL(widget.taskModel.sId.toString()));

    setState(() {

    });

    if(response.isSuccess){
      widget.refreshParent();
      showSnackbar(context, 'Task deleted...!');

    }
  }

  Future<void>changeStatus(String status) async {
    final response = await ApiCaller.getRequest(URL: TMUrls.updateTaskURL(widget.taskModel.sId.toString(), status));

    setState(() {

    });

    if(response.isSuccess){
      widget.refreshParent();
      Navigator.pop(context);
      showSnackbar(context, 'Task updated...!');

    }
  }

  void showChangeStatusDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Change task status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              child: ListTile(
                title: Text('New'),
                trailing: widget.taskModel.status == "New"? Icon(Icons.check_circle, color: Colors.green,) : null,
                onTap: (){
                  changeStatus('New');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Progress'),
                trailing: widget.taskModel.status == "Progress"? Icon(Icons.check_circle, color: Colors.green,) : null,
                onTap: (){
                  changeStatus('Progress');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Completed'),
                trailing: widget.taskModel.status == "Completed"? Icon(Icons.check_circle, color: Colors.green,) : null,
                onTap: (){
                  changeStatus('Completed');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Cancelled'),
                trailing: widget.taskModel.status == "Cancelled"? Icon(Icons.check_circle, color: Colors.green,) : null,
                onTap: (){
                  changeStatus('Cancelled');
                },
              ),
            ),
          ],
        ),
      );
    });
  }

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

                  IconButton(onPressed: (){
                    showChangeStatusDialog();
                  }, icon: Icon(Icons.edit_note, color: Colors.orange,)),
                  IconButton(onPressed: (){
                    deleteTask();
                  }, icon: Icon(Icons.delete, color: Colors.red,)),
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}