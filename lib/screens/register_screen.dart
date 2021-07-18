//import 'package:assignment220190369/screens/login_screen.dart';
import 'package:assignment220190369/screens/welcome_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register-screen';
  //const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

enum ExcitementLevel { excited, notExcited }

class _RegisterScreenState extends State<RegisterScreen> {
  //var years = ['2020', '2019', '2018', '2017'];
  var dropDownValue = '2020';
  var userPassword = '';
  var regularUpdateToggle = false;
  var bitsId = '';
  var excitementLevel = ExcitementLevel.excited;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height -
                appBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Container(
                //   child: Center(
                //     child: Text(
                //       'CRUX FLUTTER SUMMER GROUP',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
                //   height: 60,
                //   width: double.infinity,
                //   color: Theme.of(context).primaryColor,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'ID Number',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty)
                          return 'Please provide ID';
                        else if (!val.endsWith('H') ||
                            !val.startsWith('20') ||
                            val.length != 13) return 'Provide correct ID';
                      },
                      onSaved: (val) => bitsId = val!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Please enter your BITS ID Number ',
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'Enter password';
                        else if (value.length < 8)
                          return 'Password must be have 8 characters';
                        else
                          return null;
                      },
                      onSaved: (value) {
                        userPassword = value!;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Please enter your password ',
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Batch',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade800),
                      value: dropDownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                      items: <String>['2020', '2019', '2018', '2017']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        //hintText: 'Please enter your password ',
                        border: InputBorder.none,
                      ),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Receive Regular Updates',
                    //       style:
                    //           TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    //     ),
                    //     Switch(
                    //       value: regularUpdateToggle,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           regularUpdateToggle = value;
                    //         });
                    //       },
                    //     ),
                    //   ],
                    // ),
                  ],
                ),

                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Receive Regular Updates',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  value: regularUpdateToggle,
                  onChanged: (value) {
                    setState(() {
                      regularUpdateToggle = value;
                    });
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Are you excited for this !!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: RadioListTile(
                            contentPadding: EdgeInsets.all(0),
                            value: ExcitementLevel.excited,
                            groupValue: excitementLevel,
                            onChanged: (ExcitementLevel? value) {
                              setState(() {
                                excitementLevel = value!;
                              });
                            },
                            title: Text('Yes'),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            value: ExcitementLevel.notExcited,
                            groupValue: excitementLevel,
                            onChanged: (ExcitementLevel? value) {
                              setState(() {
                                excitementLevel = value!;
                              });
                            },
                            title: Text('No'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        _formKey.currentState!.save();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => WelcomeScreen(
                                      id: bitsId,
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Theme.of(context).primaryColor)),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Already have an account?  ',
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                      TextSpan(
                        text: 'Sign in',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              Navigator.pushReplacementNamed(context, '/'),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Center(
        child: Text(
          'CRUX FLUTTER SUMMER GROUP',
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
