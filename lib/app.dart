import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app_with_api/task_manager/screens/email_address_screen.dart';
import 'package:task_manager_app_with_api/task_manager/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return MaterialApp(
          theme: ThemeData(
            textTheme: TextTheme(
              titleLarge: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),

            inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.white,
              filled: true,

              hintStyle: TextStyle(
                color: Colors.grey,
              ),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),

              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),

            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
                fixedSize: Size.fromWidth(double.maxFinite),

                padding: EdgeInsets.symmetric(
                  vertical: 12,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),

              ),
            ),
          ),
          
          debugShowCheckedModeBanner: false,
          title: 'Task Manager App',

          initialRoute: '/SplashScreen',
          // initialRoute: '/EmailAddressScreen',

          routes: {
            '/SplashScreen' : (context) => SplashScreen(),
            '/EmailAddressScreen' : (context) => EmailAddressScreen(),
          },
        );
      },
    );
  }
}
