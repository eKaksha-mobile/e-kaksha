class StudentModel {
  final String _name;
  final String _email;
  final int _semester;
  final List<String> _subject;

  StudentModel(this._name, this._email, this._semester, this._subject);

  int get semester => _semester;

  String get email => _email;

  String get name => _name;

  List<String> get subject => _subject;
}