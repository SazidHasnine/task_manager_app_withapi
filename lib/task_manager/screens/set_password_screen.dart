import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app_with_api/task_manager/screens/login_screen.dart';
import 'package:task_manager_app_with_api/task_manager/widget/screen_bg.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  onTapLogin(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150,),

            Text(
              'Your Email Address',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            SizedBox(height: 25,),

            Text(
              'A 6 digit verification code will be sent to your email address',
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),

            SizedBox(height: 20,),

            FilledButton(
                onPressed: (){},
                child: Icon(Icons.arrow_circle_right_outlined)
            ),

            SizedBox(height: 35,),

            Center(
              child: RichText(text: TextSpan(
                text: "Have account?",
                style: TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "  Sign in",

                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),

                    recognizer: TapGestureRecognizer()..onTap = onTapLogin,
                  ),
                ],
              )),
            ),
          ],
        ),
      )),
    );
  }
}
