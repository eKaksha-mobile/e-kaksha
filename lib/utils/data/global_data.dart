// import 'package:ekaksha/model/student_model.dart';

import 'package:ekaksha/utils/model/student_model.dart';
import 'package:ekaksha/utils/model/subject_model.dart';
import 'package:ekaksha/utils/model/teacher_model.dart';

class GlobalData {
  static bool login = false;
  static String designation = '';
  static bool isTeacher = false;
  static StudentModel studentModel = StudentModel();
  static TeacherModel teacherModel = TeacherModel();
  static List<SubjectModel> subjectModels = <SubjectModel>[];

  static List<StudentModel> allStudentModelList = <StudentModel>[];
}
