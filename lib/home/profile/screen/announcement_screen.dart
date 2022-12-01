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
  String dropdownvalue = 'All Classes';

  var subList = ['All Classes'];

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
    GlobalData.subjectModels.forEach((element) => subList.add(element.title));
  }

  Future loadAssignmentModelsData() async {
    // if (GlobalData.allStudentModelList.isEmpty) {
    //   GlobalData.allStudentModelList =
    //   await GetIt.I.get<FirebaseService>().getAllStudentModelList();
    // }

    newAssignmentsData = [];

    assignmentsData = await GetIt.I
        .get<FirebaseService>()
        .getAssignmentDataModelListBySubjectId(
            ClassRoomScreen.currentSubjectModel.id);

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
  }

  Widget build(BuildContext context) {
    String dropdownValue = 'All Classes';

    return Scaffold(
      appBar: AppBar(
        title: Text('Announcement'),
      ),
      body: ListView(
        children: [
          // IntroCard(
          //     ClassRoomScreen.currentSubjectModel.title,
          //     '${ClassRoomScreen.currentSubjectModel.teacherFirstName} ${ClassRoomScreen.currentSubjectModel.teacherLastName}',
          //     ClassRoomScreen.currentSubjectModel.assetName),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                120 -
                MediaQuery.of(context).padding.top -
                kToolbarHeight,
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  NotesItemCard(newAssignmentsData.elementAt(index)),
              itemCount: newAssignmentsData.length,
            ),
          ),
        ],
      ),
    );
  }
}
