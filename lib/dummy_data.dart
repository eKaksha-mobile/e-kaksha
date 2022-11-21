import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekaksha/utils/data/global_data.dart';
// import 'package:ekaksha/utils/model/ClassModel.dart';
import 'package:ekaksha/utils/model/assignment_model.dart';
import 'package:ekaksha/utils/model/subject_model.dart';

// import 'model/assignment_model.dart';
// import 'model/ClassModel.dart';
// import 'model/student_model.dart';

// const List dummyData = [
//   {
//     'name': 'ekaksha',
//     'email': 'ekaksha.official.app@gmail.com',
//     'semester': 6,
//     'totalScore': 50
//   },
//   {
//     'name': 's2',
//     'email': 's1@gmail.com',
//     'semester': 7,
//     'gender': "Male",
//     'pending': 0,
//     'phoneNo': 345678,
//     'rollNo': 103,
//     'totalScore': 30
//   },
//   {'name': 's3', 'email': 's3@gmail.com', 'semester': 6, 'totalScore': 80},
//   {'name': 't1', 'email': 't1@gmail.com', 'semester': 6, 'totalScore': 100},
// ];

// const List<SubjectModel> dummyClasses = [
//   SubjectModel(
//       '_id1', 'Data Mining', 'Jagpreet', 'Singh', 7, 'assets/images/1.png'),
//   SubjectModel(
//       '_id2', 'Deep Learning', 'Jagpreet', 'Singh', 7, 'assets/images/2.png'),
//   SubjectModel(
//       '_id3', 'Block Chain', 'Aditya', 'Sharma', 7, 'assets/images/3.png'),
//   SubjectModel('_id4', 'Road Safety', 'Suraj', 'Shrivastva', 7,
//       'assets/images/banner4.jpg'),
//   SubjectModel('_id5', 'Network Security', 'Monika', 'Sachdeva', 7,
//       'assets/images/banner5.jpg'),
// ];

// const Map dummySemSubject = {
//   '7': [
//     'Data Mining',
//     'Deep Learning',
//     'Block Chain',
//     'Road Safety',
//     'Network Security'
//   ],
//   '6': [
//     'Machine Learning',
//     'Artificial Intelligence',
//     'Cloud Computing',
//     'Compiler Design'
//   ]
// };

List<AssignmentModel> dummyAssignments = [
  AssignmentModel('_title', DateTime.now(), '_question', 3,
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
  AssignmentModel('_title', DateTime.now(), '_question', 3,
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
  AssignmentModel('_title', DateTime.now(), '_question', 3,
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
  AssignmentModel('_title', DateTime.now(), '_question', 3,
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
  AssignmentModel('_title', DateTime.now(), '_question', 3,
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
  AssignmentModel('_title', DateTime.now(), '_question', 3,
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
  AssignmentModel('_title', DateTime.now(), '_question', 3,
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
  AssignmentModel('_title', DateTime.now(), '_question', 3,
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
];

// StudentModel dummyStudent = StudentModel(
//     rollNo: '1917285',
//     firstName: 'Sidharth',
//     lastName: 'Mudgil',
//     age: 21,
//     gender: 'male',
//     email: 'smudgil102@gmail.com',
//     mobile: '9928313184',
//     semester: 7,
//     subject: dummySemSubject['7']);

// StudentModel dummyStudent = StudentModel(
//   rollNo: 2025712,
//   firstName: 'Manthan',
//   lastName: 'Sharma',
//   email: 'mathansharma79826@gmail.com',
//   mobile: 7018179826,
//   semester: 7,
//   gender: 'Male',
//   dob: Timestamp.fromDate(DateTime.parse('2001-09-04')),
//   totalScore: 75.80,
//   pendingAssignments: 2,
// );
