import 'package:ekaksha/utils/model/assignment_data_model.dart';
import 'package:ekaksha/utils/model/assignment_model.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// import '../../../model/assignment_model.dart';
import '../assignment_screen.dart';
import '../../../utils/widget/leading_icon_text.dart';
import 'examiner_card.dart';

class NotesItemCard extends StatelessWidget {
  final AssignmentDataModel notesModel;

  const NotesItemCard(this.notesModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AssignmentScreen.route, arguments: notesModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExaminerCard(notesModel),
              const SizedBox(
                height: 10,
              ),
              Text(
                notesModel.description,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              LeadingIconText(
                icon: Icons.attach_file,
                label: 'attachments',
              ),
              ElevatedButton(
                  onPressed: () async {
                    print(await GetIt.I.get<FirebaseService>().isPathHavingFiles(
                        'assignments_data_pdf/5637d44c-58ea-47c1-a158-941622b9972f/'));
                  },
                  child: Text('click')),
            ],
          ),
        ),
      ),
    );
  }
}
