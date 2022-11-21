class SubjectModel {
  final String _id;
  final String _title;
  final String _teacherFirstName;
  final String _teacherLastName;
  final int _semester;
  final String _assetName;

  const SubjectModel(this._id, this._title, this._teacherFirstName,
      this._teacherLastName, this._semester, this._assetName);

  String get assetName => _assetName;

  int get semester => _semester;

  String get teacherLastName => _teacherLastName;

  String get teacherFirstName => _teacherFirstName;

  String get title => _title;

  String get id => _id;
}
