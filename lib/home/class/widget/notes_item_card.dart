import 'package:ekaksha/utils/model/assignment_data_model.dart';
import 'package:ekaksha/utils/model/assignment_model.dart';
import 'package:ekaksha/utils/screens/pdf_viewer.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:ekaksha/utils/widget/vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// import '../../../model/assignment_model.dart';
import '../assignment_screen.dart';
import '../../../utils/widget/leading_icon_text.dart';
import 'examiner_card.dart';

class NotesItemCard extends StatefulWidget {
  const NotesItemCard(this.notesModel, {Key? key}) : super(key: key);

  final AssignmentDataModel notesModel;

  @override
  State<NotesItemCard> createState() => _NotesItemCardState();
}

class _NotesItemCardState extends State<NotesItemCard> {
  String attachments = '';
  List<String> attachmentsList = [];
  List itemWidget = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    () async {
      bool result = await GetIt.I.get<FirebaseService>().isPathHavingFiles(
          'assignments_data_pdf/${widget.notesModel.assignmentId}/');
      if (result) {
        attachmentsList = await GetIt.I
            .get<FirebaseService>()
            .getFileNamesFromPath(
                'assignments_data_pdf/${widget.notesModel.assignmentId}/');
        setState(() {
          attachmentsList;
        });
        // setState(() {
        //   attachments = attachmentsList.first;
        // });
      }
    }();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        AssignmentScreen.currentAssignmentDataModel = await GetIt.I
            .get<FirebaseService>()
            .getAssignmentDataModelByAssignmentId(
                widget.notesModel.assignmentId);
        Navigator.of(context).pushNamed(AssignmentScreen.route, arguments: {
          'notesModel': widget.notesModel,
          'attachmentsList': attachmentsList
        });
      },
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExaminerCard(widget.notesModel),
              const VerticalSpacer(10),
              Text(
                widget.notesModel.description,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => LeadingIconText(
                    iconSize: 18.0,
                    labelSize: 14.0,
                    iconSpacing: 4.0,
                    verticalMargin: 0.5,
                    horizontalMargin: 0.0,
                    labelHeight: 1.0,
                    iconColor: Colors.red,
                    labelColor: Colors.red,
                    icon: Icons.attach_file,
                    label: attachmentsList[index],
                    callback: () async {
                      var documentBytes = await GetIt.I
                          .get<FirebaseService>()
                          .getPdfBytes(
                              'assignments_data_pdf/${widget.notesModel.assignmentId}/${attachmentsList[index]}');
                      () {
                        // String text = GetIt.I
                        //     .get<FirebaseService>()
                        //     .extractText(documentBytes!);
                        // print(text.replaceAll('\n ', ' '));
                        Navigator.of(context)
                            .pushNamed(PdfViewer.route, arguments: {
                          'documentBytes': documentBytes,
                          'title': attachmentsList[index],
                        });
                      }();
                    }),
                itemCount: attachmentsList.length,
              ),
              // LeadingIconTextSmall(
              //   icon: Icons.attach_file,
              //   label: attachments == '' ? 'No attachments' : attachments,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
