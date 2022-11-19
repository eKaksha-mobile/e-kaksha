import 'home/model/ClassModel.dart';

const List dummyData = [
  {
    'name': 'ekaksha',
    'email': 'ekaksha.official.app@gmail.com',
    'semester': 6,
  },
  {
    'name': 's2',
    'email': 's1@gmail.com',
    'semester': 7,
  },
  {
    'name': 's3',
    'email': 's3@gmail.com',
    'semester': 6,
  },
  {
    'name': 't1',
    'email': 't1@gmail.com',
    'semester': 6,
  },
];

const List<ClassModel> dummyClasses = [
  ClassModel('_id1', 'Data Mining', 'Jagpreet', 'Singh', 7, 'assets/images/banner1.jpg'),
  ClassModel('_id2', 'Deep Learning', 'Jagpreet', 'Singh', 7, 'assets/images/banner2.jpg'),
  ClassModel('_id3', 'Block Chain', 'Aditya', 'Sharma', 7, 'assets/images/banner3.jpg'),
  ClassModel('_id4', 'Road Safety', 'Suraj', 'Shrivastva', 7, 'assets/images/banner4.jpg'),
  ClassModel('_id5', 'Network Security', 'Monika', 'Sachdeva', 7, 'assets/images/banner5.jpg'),
];

const Map dummySemSubject = {
  '7': [
    'Data Mining',
    'Deep Learning',
    'Block Chain',
    'Road Safety',
    'Network Security'
  ],
  '6': [
    'Machine Learning',
    'Artificial Intelligence',
    'Cloud Computing',
    'Compiler Design'
  ]
};