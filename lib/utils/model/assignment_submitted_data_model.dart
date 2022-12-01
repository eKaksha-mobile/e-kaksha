import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AssignmentSubmittedDataModel {
  final String _assignmentId;
  final String _assignmentName;
  final Timestamp _submittedOn;
  final int _semester;
  final int _maxMarks;
  final int _marks;
  final bool _lateSubmission;
  final String _studentEmail;
  final String _studentFirstName;
  final String _studentLastName;
  final int _plagiarizedAmount;
  final bool _isChecked;

  AssignmentSubmittedDataModel({
    assignmentId = 0,
    assignmentName = '',
    submittedOn = 0,
    semester = 0,
    maxMarks = 0,
    marks = 0,
    lateSubmission = false,
    studentEmail = '',
    studentFirstName = '',
    studentLastName = '',
    plagiarizedAmount = 0,
    isChecked = false,
  })  : _assignmentId = assignmentId,
        _assignmentName = assignmentName,
        _submittedOn = submittedOn,
        _semester = semester,
        _maxMarks = maxMarks,
        _marks = marks,
        _lateSubmission = lateSubmission,
        _studentEmail = studentEmail,
        _studentFirstName = studentFirstName,
        _studentLastName = studentLastName,
        _plagiarizedAmount = plagiarizedAmount,
        _isChecked = isChecked;

  int get plagiarizedAmount => _plagiarizedAmount;

  String get studentLastName => _studentLastName;

  String get studentFirstName => _studentFirstName;

  String get studentEmail => _studentEmail;

  bool get lateSubmission => _lateSubmission;

  int get marks => _marks;

  int get maxMarks => _maxMarks;

  int get semester => _semester;

  Timestamp get submittedOn => _submittedOn;

  String get assignmentName => _assignmentName;

  String get assignmentId => _assignmentId;

  bool get isChecked => _isChecked;
}
