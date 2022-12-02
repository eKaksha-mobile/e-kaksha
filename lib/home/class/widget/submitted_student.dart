import 'package:flutter/material.dart';

import '../scoring_screen.dart';

class SubmittedStudent extends StatelessWidget {
  final int index;
  final String data;
  final int marks;
  final int maxMarks;
  final bool isChecked;

  const SubmittedStudent(
    this.data, {
    super.key,
    required this.index,
    required this.marks,
    required this.maxMarks,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(ScoringScreen.route),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        backgroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/3011/3011270.png'),
                        radius: 22.5,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data}".toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins'),
                              ),
                              const SizedBox(
                                height: 1.5,
                              ),
                              Text(
                                "Score : ${marks} / ${maxMarks}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueGrey[200]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(
                  isChecked ? Icons.check_circle_outline : Icons.highlight_off,
                  size: 30,
                  color: isChecked ? Colors.green : Colors.red,
                )
              ],
            )),
      ),
    );
  }
}
