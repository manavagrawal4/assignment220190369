import 'package:assignment220190369/screens/login_screen.dart';
import 'package:assignment220190369/screens/register_screen.dart';
//import 'package:assignment220190369/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xFF2FC4B2),
          // primarySwatch: Colors.amber,
        ),
        // home: LoginScreen(),
        routes: {
          '/': (ctx) => LoginScreen(),
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
        });
  }
}
