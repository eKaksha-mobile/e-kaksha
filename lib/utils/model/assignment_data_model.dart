import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AssignmentDataModel {
  final String _assignmentId;
  final String _assignmentName;
  final Timestamp _dueDate;
  final int _semester;
  final int _maxMarks;
  final String _subjectId;
  final String _subjectName;
  final String _teacherEmail;
  final String _teacherFirstName;
  final String _teacherLastName;
  final String _description;

  AssignmentDataModel(
      {assignmentId = '',
      assignmentName = '',
      dueDate = 0,
      semester = 0,
      maxMarks = 0,
      subjectId = '',
      subjectName = '',
      teacherEmail = '',
      teacherFirstName = '',
      teacherLastName = '',
      description = ''})
      : _assignmentId = assignmentId,
        _assignmentName = assignmentName,
        _dueDate = dueDate == 0 ? Timestamp.now() : dueDate,
        _semester = semester,
        _maxMarks = maxMarks,
        _subjectId = subjectId,
        _subjectName = subjectName,
        _teacherEmail = teacherEmail,
        _teacherFirstName = teacherFirstName,
        _teacherLastName = teacherLastName,
        _description = description;

  String get teacherLastName => _teacherLastName;

  String get teacherFirstName => _teacherFirstName;

  String get teacherEmail => _teacherEmail;

  String get subjectName => _subjectName;

  String get subjectId => _subjectId;

  int get maxMarks => _maxMarks;

  int get semester => _semester;

  Timestamp get dueDate => _dueDate;

  String get assignmentName => _assignmentName;

  String get assignmentId => _assignmentId;

  String get description => _description;
}
