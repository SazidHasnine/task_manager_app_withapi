import 'package:flutter/material.dart';
import 'package:task_manager_app_with_api/task_manager/screens/cancel_task_screen.dart';
import 'package:task_manager_app_with_api/task_manager/screens/completed_task_screen.dart';
import 'package:task_manager_app_with_api/task_manager/screens/new_task_screen.dart';
import 'package:task_manager_app_with_api/task_manager/screens/progress_task_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int selectedIndex = 0;

  List screens = [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompletedTaskScreen(),
    CancelTaskScreen(),
  ];

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
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBar(

          selectedIndex: selectedIndex,

          onDestinationSelected: (int index){
            selectedIndex = index;
            setState(() {

            });
          },

          destinations: [
            NavigationDestination(icon: Icon(Icons.task), label: 'New'),
            NavigationDestination(icon: Icon(Icons.refresh), label: 'Progress'),
            NavigationDestination(icon: Icon(Icons.task_alt_outlined), label: 'Completed'),
            NavigationDestination(icon: Icon(Icons.cancel_outlined), label: 'Cancel'),

      ]),
    );
  }
}
