import 'package:flutter/cupertino.dart';

class AssignmentData with ChangeNotifier {
  var _assignmentScores = List<double?>.filled(6, null);
  List<double?> get getAssignmentScores {
    return [..._assignmentScores];
  }

  void setAssignmentScore(String index, String score) {
    _assignmentScores[int.parse(index) - 1] = double.parse(score);
    notifyListeners();
  }

  int getCompletionNumber() {
    int sum = 0;
    for (int i = 0; i < _assignmentScores.length; ++i) {
      if (_assignmentScores[i] != null) {
        ++sum;
      }
    }
    return sum;
  }

  double? scoreTotal() {
    return getAssignmentScores.reduce((value, element) {
      return (value ?? 0) + (element ?? 0);
    });
  }
}
