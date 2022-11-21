// import 'package:ekaksha/model/student_model.dart';

import 'package:ekaksha/utils/model/student_model.dart';
import 'package:ekaksha/utils/model/subject_model.dart';
import 'package:ekaksha/utils/model/teacher_model.dart';

class GlobalData {
  static String designation = '';
  static StudentModel studentModel = StudentModel();
  static TeacherModel teacherModel = TeacherModel();
  static List<SubjectModel> subjectModels = <SubjectModel>[];
}
