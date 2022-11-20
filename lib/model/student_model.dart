class StudentModel {
  final String _rollNo;
  final String _firstName;
  final String _lastName;
  final int _age;
  final String _gender;
  final String _email;
  final String _mobile;
  final int _semester;
  final List<String> _subject;

  const StudentModel(
      {required rollNo,
      required firstName,
      required lastName,
      required age,
      required gender,
      required email,
      required mobile,
      required semester,
      required subject})
      : _rollNo = rollNo,
        _firstName = firstName,
        _lastName = lastName,
        _age = age,
        _gender = gender,
        _email = email,
        _mobile = mobile,
        _semester = semester,
        _subject = subject;


  int get age => _age;

  List<String> get subject => _subject;

  int get semester => _semester;

  String get mobile => _mobile;

  String get email => _email;

  String get lastName => _lastName;

  String get firstName => _firstName;

  String get rollNo => _rollNo;

  String get gender => _gender;
}
