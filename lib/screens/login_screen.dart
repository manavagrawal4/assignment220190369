import 'package:assignment220190369/screens/register_screen.dart';
import 'package:assignment220190369/screens/welcome_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  //const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, String> userData = {'ID': '', 'password': ''};

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            //alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
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

                Container(
                  //color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            validator: (val) {
                              if (val!.isEmpty)
                                return 'Please provide ID';
                              else if (!val.endsWith('H') ||
                                  !val.startsWith('20') ||
                                  val.length != 13) return 'Provide valid ID';
                            },
                            onSaved: (value) {
                              userData['ID'] = value!;
                            },
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
                              userData['password'] = value!;
                            },
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Please enter your password ',
                              border: InputBorder.none,
                            ),
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
                                            id: userData['ID'],
                                          )));
                            },
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'LOG IN',
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
                      Center(
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),

                // Spacer(
                //   flex: 1,
                // ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Don\'t have an account?  ',
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                      TextSpan(
                        text: 'Register',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushReplacementNamed(
                              context, RegisterScreen.routeName),
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
}
