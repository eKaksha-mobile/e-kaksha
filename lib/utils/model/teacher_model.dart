import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherModel {
  final String _firstName;
  final String _lastName;
  final String _email;
  final int _mobile;
  final String _gender;
  final Timestamp _dob;

  late final int? _age;

  TeacherModel({
    firstName = '',
    lastName = '',
    email = '',
    mobile = 0,
    gender = '',
    dob = 0,
  })  : _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _mobile = mobile,
        _gender = gender,
        _dob = dob == 0 ? Timestamp.now() : dob,
        _age = AgeCalculator.age(
                dob == 0 ? Timestamp.now().toDate() : dob.toDate())
            .years;

  Timestamp get dob => _dob;

  String get gender => _gender;

  int get mobile => _mobile;

  String get email => _email;

  String get lastName => _lastName;

  String get firstName => _firstName;

  int? get age => _age;
}
