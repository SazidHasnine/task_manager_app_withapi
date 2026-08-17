import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app_with_api/task_manager/data/models/api_response.dart';
import 'package:task_manager_app_with_api/task_manager/data/service/api_caller.dart';
import 'package:task_manager_app_with_api/task_manager/providers/auth_provider.dart';
import 'package:task_manager_app_with_api/task_manager/screens/login_screen.dart';
import 'package:task_manager_app_with_api/task_manager/utils/urls.dart';
import 'package:task_manager_app_with_api/task_manager/widget/screen_bg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  onTapLogin(){
    Navigator.pop(context);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNamController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signUp() async {

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    bool isSignUp = await authProvider.signUp(
        email: _emailController.text,
        firstName: _firstNamController.text,
        lastName: _lastnameController.text,
        mobile: _mobileController.text,
        password: _passwordController.text);

    // final ApiResponse response = await ApiCaller.postRequest(URL: TMUrls.SignupURL,
    // body: {
    //   "email": _emailController.text,
    //   "firstName": _firstNamController.text,
    //   "lastName": _lastnameController.text,
    //   "mobile": _mobileController.text,
    //   "password": _passwordController.text
    // },
    // );

    if(isSignUp){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully signed up....!!!')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong....???')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
          
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150,),
          
              Text(
                'Join with us',
                style: Theme.of(context).textTheme.titleLarge,
              ),
          
              SizedBox(height: 25,),
          
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter email';
                  }else{
                    return null;
                  }
                },
              ),
          
              SizedBox(height: 10,),
          
              TextFormField(
                controller: _firstNamController,
                decoration: InputDecoration(
                  hintText: 'First Name',
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter first name';
                  }else{
                    return null;
                  }
                },
              ),
          
              SizedBox(height: 10,),
          
              TextFormField(
                controller: _lastnameController,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter last name';
                  }else{
                    return null;
                  }
                },
              ),
          
              SizedBox(height: 10,),
          
              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(
                  hintText: 'Mobile',
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter mobile number';
                  }else{
                    return null;
                  }
                },
              ),
          
              SizedBox(height: 10,),
          
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter password';
                  }else{
                    return null;
                  }
                },
              ),
          
              SizedBox(height: 20,),
          
              FilledButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      signUp();
                    }
                  },
                  child: Icon(Icons.arrow_circle_right_outlined)
              ),
          
              SizedBox(height: 35,),
          
              Center(
                child: RichText(text: TextSpan(
                  text: "Have account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
          
                  ),
                  children: [
                    TextSpan(
                      text: "  Sign in",

                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
          
                      recognizer: TapGestureRecognizer()..onTap = onTapLogin,

                    // The manual way without cascades
                    // var myRecognizer = TapGestureRecognizer();
                    // myRecognizer.onTap = onTapLogin;

// Then pass myRecognizer to the RichText/TextSpan

                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      )),
    );;
  }
}
