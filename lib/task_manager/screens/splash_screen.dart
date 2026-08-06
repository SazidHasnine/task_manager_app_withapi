import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_app_with_api/task_manager/controller/auth_controller.dart';
import 'package:task_manager_app_with_api/task_manager/screens/login_screen.dart';
import 'package:task_manager_app_with_api/task_manager/screens/main_nav_screen.dart';
import 'package:task_manager_app_with_api/task_manager/utils/asset_path.dart';
import 'package:task_manager_app_with_api/task_manager/widget/screen_bg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToNextScreen();
  }

  Future<void> moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));

    AuthController.getUserData();
    final bool isLogin = await AuthController.isUserLogin();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> isLogin ? MainNavScreen() : LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBG(child: Center(child: Image.asset(AssetPath.logo, width: 300, height: 300,)),);
  }
}

