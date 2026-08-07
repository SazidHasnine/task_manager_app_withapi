import 'package:flutter/material.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/api_response.dart';
import 'package:task_manager_app_with_api/task_manager/data/service/api_caller.dart';
import 'package:task_manager_app_with_api/task_manager/screens/main_nav_screen.dart';
import 'package:task_manager_app_with_api/task_manager/utils/urls.dart';
import 'package:task_manager_app_with_api/task_manager/widget/screen_bg.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
// final TextEditingController _titleController = TextEditingController();
// final TextEditingController _descriptionController = TextEditingController();

  Future<void> createTask() async {
    final ApiResponse response = await ApiCaller.postRequest(URL: TMUrls.createTaskURL,
      body: {
        "title": titleController.text,
        "description": descriptionController.text,
        "status":"New"
      },
    );

    if(response.isSuccess){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('New task added....!!!')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong....???')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/73784258?s=400&u=da434207515bb916f36350ddd4a236fb678bad94&v=4'),
            ),

            SizedBox(width: 10,),

            Column(
              children: [
                Text('Sazid Hasnine', style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                ),),
                Text('xyz@gmail.com', style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                ),),
              ],
            ),
          ],
        ),
      ),
      body: ScreenBG(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),

                  Text(
                    'Add New Task',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  SizedBox(height: 25,),

                  TextFormField(
                    controller: titleController,
                    //controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'Task title',
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter task title';
                      }else{
                        return null;
                      }
                    },
                  ),

                  SizedBox(height: 10,),

                  TextFormField(
                    maxLines: 6,
                    controller: descriptionController,
                    //controller: _descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Description',
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter task description';
                      }else{
                        return null;
                      }
                    },
                  ),

                  SizedBox(height: 20,),

                  FilledButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          createTask();
                        }
                      }, child: Icon(Icons.arrow_circle_right_outlined)
                  ),

                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
