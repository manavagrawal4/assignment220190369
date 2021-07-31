import 'package:assignment220190369/providers/assignment_data.dart';
import 'package:assignment220190369/providers/user_data.dart';
import 'package:assignment220190369/screens/track_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssignmentData>(context);

    return FutureBuilder(
      future: Provider.of<UserData>(context, listen: false).setNameAndId(),
      builder: (ctx, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              body: Container(
                margin: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Consumer<UserData>(
                      builder: (ctx, userData, _) => Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Hi ${userData.getPrefStatus ? userData.getFullName : userData.getId}',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFFD7FFFA)),
                      //margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      //color: Colors.red,
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Progress',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                '${provider.getCompletionNumber()}/6\nassignments done',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          )),
                          CircleAvatar(
                            maxRadius: 50,
                            child: Text(
                              '${((provider.getCompletionNumber() / 6) * 100).toStringAsFixed(2)}%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Score',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              maxRadius: 50,
                              child: Text(
                                '${provider.scoreTotal()}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, TrackScreen.routeName);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'TRACK',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
