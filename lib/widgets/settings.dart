import 'package:assignment220190369/providers/user_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum HomeBio { name, id }

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    HomeBio _homeBio =
        Provider.of<UserData>(context, listen: false).getPrefStatus
            ? HomeBio.name
            : HomeBio.id;
    return Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Home Bio',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: HomeBio.name,
                      groupValue: _homeBio,
                      onChanged: (HomeBio? value) {
                        setState(() {
                          _homeBio = value!;
                          Provider.of<UserData>(context, listen: false)
                              .setHomeBioPref(true);
                        });
                      },
                      title: Text('Name'),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: HomeBio.id,
                      groupValue: _homeBio,
                      onChanged: (HomeBio? value) {
                        setState(() {
                          _homeBio = value!;
                          Provider.of<UserData>(context, listen: false)
                              .setHomeBioPref(false);
                        });
                      },
                      title: Text('ID'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
