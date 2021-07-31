import 'package:assignment220190369/providers/assignment_data.dart';

import 'package:assignment220190369/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen/home/track';
  @override
  _TrackScreenState createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  var dropDownValue = '1';
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssignmentData>(context);
    var initailScore =
        provider.getAssignmentScores[int.parse(dropDownValue) - 1];
    var scoreController = TextEditingController(
      text: initailScore == null ? '' : initailScore.toString(),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Assignment Number',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                      DropdownButtonFormField<String>(
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade800),
                        value: dropDownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownValue = newValue!;
                          });
                        },
                        items: <String>['1', '2', '3', '4', '5', '6']
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
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Score',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty)
                            return 'enter score';
                          else if (double.parse(value) > 10 ||
                              double.parse(value) < 0)
                            return 'enter score from 0-10';
                        },
                        enabled: provider.getAssignmentScores[
                                int.parse(dropDownValue) - 1] ==
                            null,
                        controller: scoreController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Please enter your score ',
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ButtonWidget(
                title: 'SUBMIT',
                onButtonPressed: initailScore == null
                    ? () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        provider.setAssignmentScore(
                            dropDownValue, scoreController.text);
                      }
                    : null),
          ],
        ),
      ),
    );
  }
}
