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
    teacherEmail = '',
    assetName = '',
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

  static String getAssetName(String value) {
    String assetName = 'assets/images/';
    int sum = 0;
    if (value.trim().isNotEmpty) {
      for (int i = 0; i < value.length; i++) {
        (value[i].toUpperCase() == value[i])
            ? sum += (64 - value.codeUnitAt(i))
            : sum += (96 - value.codeUnitAt(i));
      }
    }
    assetName = '$assetName${(sum % 3) + 1}.png';

    return assetName;
  }

  @override
  String toString() {
    return 'SubjectModel{_id: $_id, _title: $_title, _teacherEmail: $_teacherEmail, _teacherFirstName: $_teacherFirstName, _teacherLastName: $_teacherLastName, _semester: $_semester, _assetName: $_assetName}';
  }
}
