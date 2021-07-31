import 'package:assignment220190369/providers/assignment_data.dart';
import 'package:assignment220190369/providers/user_data.dart';
import 'package:assignment220190369/screens/home_screen.dart';
import 'package:assignment220190369/screens/login_screen.dart';
import 'package:assignment220190369/screens/register_screen.dart';
import 'package:assignment220190369/screens/track_screen.dart';
//import 'package:assignment220190369/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserData()),
        ChangeNotifierProvider(create: (ctx) => AssignmentData()),
      ],
      child: Consumer<UserData>(
        builder: (ctx, userData, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: Color(0xFF2FC4B2),
              // primarySwatch: Colors.amber,
            ),
            home: userData.isSignedIn
                ? HomeScreen()
                : FutureBuilder(
                    future: userData.tryAutoLogin(),
                    builder: (ctx, snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting
                            ? Scaffold(
                                body: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : LoginScreen()),
            routes: {
              // '/': (ctx) => LoginScreen(),
              RegisterScreen.routeName: (ctx) => RegisterScreen(),
              TrackScreen.routeName: (ctx) => TrackScreen(),
              HomeScreen.routeName: (ctx) => HomeScreen(),
            }),
      ),
    );
  }
}
