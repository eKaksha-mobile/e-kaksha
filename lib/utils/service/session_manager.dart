import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/student_model.dart';
import '../model/subject_model.dart';
import '../model/teacher_model.dart';
import 'firebase_service.dart';

class SessionManager {
  static Future<bool> isActive() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.containsKey('session_active')) {
      GlobalData.sessionActive = pref.getBool('session_active')!;
      return GlobalData.sessionActive;
    }
    return false;
  }

  static Future<void> logoutUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    GlobalData.sessionActive = false;
    pref.setBool('session_active', false);
  }

  static Future<void> loginRegisterUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('session_active', true);
    pref.setBool('user_is_teacher', GlobalData.isTeacher);

    GlobalData.sessionActive = true;

    debugPrint('session: ${GlobalData.sessionActive}');
    debugPrint('isTeacher: ${GlobalData.isTeacher}');

    if (GlobalData.isTeacher) {
      pref.setString('t_firstName', GlobalData.teacherModel.firstName);
      pref.setString('t_lastName', GlobalData.teacherModel.lastName);
      pref.setString('t_email', GlobalData.teacherModel.email);
      pref.setInt('t_mobile', GlobalData.teacherModel.mobile);
      pref.setString('t_gender', GlobalData.teacherModel.gender);
      pref.setInt('t_dob', GlobalData.teacherModel.dob.microsecondsSinceEpoch);
      debugPrint('User: ${GlobalData.teacherModel}');
    } else {
      pref.setInt('s_rollNo', GlobalData.studentModel.rollNo);
      pref.setString('s_firstName', GlobalData.studentModel.firstName);
      pref.setString('s_lastName', GlobalData.studentModel.lastName);
      pref.setString('s_email', GlobalData.studentModel.email);
      pref.setInt('s_mobile', GlobalData.studentModel.mobile);
      pref.setInt('s_semester', GlobalData.studentModel.semester);
      pref.setString('s_gender', GlobalData.studentModel.gender);
      pref.setInt('s_dob', GlobalData.studentModel.dob.microsecondsSinceEpoch);
      pref.setDouble('s_totalScore', GlobalData.studentModel.totalScore);
      pref.setInt(
          's_pendingAssignments', GlobalData.studentModel.pendingAssignments);
      debugPrint('User: ${GlobalData.teacherModel}');
    }
  }

  static Future<void> getActiveUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isTeacher = pref.getBool('user_is_teacher');

    if (isTeacher != null) {
      GlobalData.isTeacher = isTeacher;
      debugPrint('isTeacher ${GlobalData.isTeacher}');

      if (isTeacher) {
        GlobalData.teacherModel = TeacherModel(
          firstName: pref.getString('t_firstName'),
          lastName: pref.getString('t_lastName'),
          email: pref.getString('t_email'),
          mobile: pref.getInt('t_mobile'),
          gender: pref.getString('t_gender'),
          dob: Timestamp.fromMicrosecondsSinceEpoch(pref.getInt('t_dob') ?? 0),
        );
        GlobalData.subjectModels = await GetIt.I
            .get<FirebaseService>()
            .getSubjectModelListByEmail(GlobalData.teacherModel.email);

        debugPrint('Active User: ${GlobalData.teacherModel}');
        debugPrint('Subject Models: ${GlobalData.subjectModels}');
      } else {
        GlobalData.studentModel = StudentModel(
          rollNo: pref.getInt('s_rollNo'),
          firstName: pref.getString('s_firstName'),
          lastName: pref.getString('s_lastName'),
          email: pref.getString('s_email'),
          mobile: pref.getInt('s_mobile'),
          semester: pref.getInt('s_semester'),
          gender: pref.getString('s_gender'),
          dob: Timestamp.fromMicrosecondsSinceEpoch(pref.getInt('s_dob') ?? 0),
          totalScore: pref.getDouble('s_totalScore'),
          pendingAssignments: pref.getInt('s_pendingAssignments'),
        );

        GlobalData.subjectModels = await GetIt.I
            .get<FirebaseService>()
            .getSubjectModelListBySem(GlobalData.studentModel.semester);

        debugPrint('Active User: ${GlobalData.studentModel}');
        debugPrint('Subject Models: ${GlobalData.subjectModels}');
      }
    }
  }

  static Future<List<SubjectModel>> getSubjectModels() async {
    if (GlobalData.isTeacher) {
      return await GetIt.I
          .get<FirebaseService>()
          .getSubjectModelListByEmail(GlobalData.teacherModel.email);
    }

    return await GetIt.I
        .get<FirebaseService>()
        .getSubjectModelListBySem(GlobalData.studentModel.semester);
  }
}
