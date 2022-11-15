class NotesModel {
  final String _title;
  final DateTime _dateTime;
  final String _question;
  final int _tAttachments;
  final String _image;

  NotesModel(this._title, this._dateTime, this._question, this._tAttachments,
      this._image);

  int get tAttachments => _tAttachments;

  String get question => _question;

  DateTime get dateTime => _dateTime;

  String get title => _title;

  String get image => _image;
}
