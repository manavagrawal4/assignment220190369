import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';
  final String? id;
  const WelcomeScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 200, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CRUX FLUTTER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    'SUMMER GROUP',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              Text(
                'Welcomes you',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                id!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Text(
                'Have a great journey ahead !!',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'New Home feature is implemented when you Register',
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
