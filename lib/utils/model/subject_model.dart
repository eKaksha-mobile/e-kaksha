class SubjectModel {
  final String _id;
  final String _title;
  final String _teacherEmail;
  final String _teacherFirstName;
  final String _teacherLastName;
  final int _semester;
  final String _assetName;

  SubjectModel({
    id = '',
    title = '',
    teacherFirstName = '',
    teacherLastName = '',
    semester = 0,
    assetName = '',
    teacherEmail = '',
  })  : _id = id,
        _title = title,
        _teacherFirstName = teacherFirstName,
        _teacherLastName = teacherLastName,
        _semester = semester,
        _assetName = assetName,
        _teacherEmail = teacherEmail;

  String get assetName => _assetName;

  int get semester => _semester;

  String get teacherLastName => _teacherLastName;

  String get teacherFirstName => _teacherFirstName;

  String get title => _title;

  String get id => _id;

  String get teacherEmail => _teacherEmail;
}
