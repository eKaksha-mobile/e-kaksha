import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  final int _rollNo;
  final String _firstName;
  final String _lastName;
  final String _email;
  final int _mobile;
  final int _semester;
  final String _gender;
  final Timestamp _dob;
  final double _totalScore;
  final int _pendingAssignments;

  late final int? _age;
  // late final List<String>? _subject;

  StudentModel({
    rollNo = 0,
    firstName = '',
    lastName = '',
    email = '',
    mobile = 0,
    semester = 0,
    gender = '',
    dob = 0,
    totalScore = 0.0,
    pendingAssignments = 0,
  })  : _rollNo = rollNo,
        _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _mobile = mobile,
        _semester = semester,
        _gender = gender,
        _dob = dob == 0 ? Timestamp.now() : dob,
        _totalScore = totalScore.toDouble(),
        _pendingAssignments = pendingAssignments,
        _age = AgeCalculator.age(
                dob == 0 ? Timestamp.now().toDate() : dob.toDate())
            .years;

  // int get age => _age;

  // List<String> get subject => _subject;

  int get rollNo => _rollNo;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get email => _email;

  int get mobile => _mobile;

  int get semester => _semester;

  String get gender => _gender;

  Timestamp get dob => _dob;

  double get totalScore => _totalScore;

  int get pendingAssignments => _pendingAssignments;

  int? get age => _age;

  @override
  String toString() {
    return 'StudentModel{_rollNo: $_rollNo, _firstName: $_firstName, _lastName: $_lastName, _email: $_email, _mobile: $_mobile, _semester: $_semester, _gender: $_gender, _dob: $_dob, _totalScore: $_totalScore, _pendingAssignments: $_pendingAssignments, _age: $_age}';
  }
}
