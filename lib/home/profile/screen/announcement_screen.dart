import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekaksha/home/class/classroom_screen.dart';
import 'package:ekaksha/home/class/widget/notes_item_card.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/model/assignment_data_model.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';

import '../../../utils/model/subject_model.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});
  static const route = '/announcement_screen';

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  List<AssignmentDataModel> assignmentsData = [];

  final TextEditingController _resetEmailTextController =
      TextEditingController();

  List<AssignmentDataModel> newAssignmentsData = [];

  // var subList = ['All Classes'];
  String dropdownValue = 'Latest Updates';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    () async {
      await loadAssignmentModelsData().whenComplete(() {
        if (!mounted) return;
        setState(() {});
      });
    }();
    // GlobalData.subjectModels.forEach((element) => subList.add(element.title)); //Adding Subjects to subList
  }

  Future loadAssignmentModelsData() async {
    // if (GlobalData.allStudentModelList.isEmpty) {
    //   GlobalData.allStudentModelList =
    //   await GetIt.I.get<FirebaseService>().getAllStudentModelList();
    // }

    List<SubjectModel> subjectList = await GetIt.I
        .get<FirebaseService>()
        .getSubjectModelListBySem(GlobalData.studentModel.semester);

    // newAssignmentsData = [];

    for (var subject in subjectList) {
      final tempList = await GetIt.I
          .get<FirebaseService>()
          .getAssignmentDataModelListBySubjectId(subject.id);
      assignmentsData.addAll(tempList);
    }

    assignmentsData.sort((a, b) {
      var comparisonResult = a.dueDate.compareTo(b.dueDate);
      return comparisonResult;
    });

    Timestamp ts = Timestamp.now();
    List<AssignmentDataModel> tempAssignmentsData = [];

    for (int i = 0; i < assignmentsData.length; i++) {
      if (assignmentsData[i].dueDate.compareTo(ts) > 0) {
        newAssignmentsData.add(assignmentsData[i]);
      }
    }

    // print(assignmentsData.length);
    // print('hi');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcement'),
      ),
      body: ListView(
        children: [
          // Container(
          //   alignment: Alignment.center,
          //   margin: EdgeInsets.only(top: 5, bottom: 3, left: 5, right: 5),
          //   decoration: BoxDecoration(
          //       border: Border.all(width: 2, color: Colors.grey.shade400)),
          //   child: DropdownButton<String>(
          //     value: dropdownValue,
          //     icon: const Icon(Icons.keyboard_arrow_down_outlined),
          //     iconSize: 20,
          //     elevation: 16,
          //     style: const TextStyle(
          //         color: Colors.black,
          //         overflow: TextOverflow.ellipsis,
          //         fontSize: 18,
          //         fontWeight: FontWeight.w500,
          //         fontFamily: 'Poppins'),
          //     onChanged: (String? newValue) {
          //       setState(() {
          //         dropdownValue = newValue!;
          //       });
          //     },
          //     items: ["Latest Updates", "Pending Assignment"]
          //         .map<DropdownMenuItem<String>>((String value) {
          //       return DropdownMenuItem<String>(
          //         value: value,
          //         child: Text(
          //           value,
          //         ),
          //       );
          //     }).toList(),
          //   ),
          // ),

          // IntroCard(
          //     ClassRoomScreen.currentSubjectModel.title,
          //     '${ClassRoomScreen.currentSubjectModel.teacherFirstName} ${ClassRoomScreen.currentSubjectModel.teacherLastName}',
          //     ClassRoomScreen.currentSubjectModel.assetName),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                65 -
                MediaQuery.of(context).padding.top -
                kToolbarHeight,
            child: ListView.builder(
              itemBuilder: (context, index) => NotesItemCard(
                newAssignmentsData.elementAt(index),
                showAttachments: false,
              ),
              itemCount: newAssignmentsData.length,
            ),
          ),
        ],
      ),
    );
  }
}
