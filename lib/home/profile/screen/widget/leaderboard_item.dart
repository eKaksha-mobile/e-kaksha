import 'package:flutter/material.dart';

class LeaderboardItem extends StatelessWidget {
  final int index;

  const LeaderboardItem({required this.index, super.key});

  EdgeInsetsGeometry getMargin(index) {
    if (index == 1) {
      return const EdgeInsets.symmetric(horizontal: 5, vertical: 5);
    } else if (index == 2) {
      return const EdgeInsets.symmetric(horizontal: 7, vertical: 5);
    } else if (index == 3) {
      return const EdgeInsets.symmetric(horizontal: 9, vertical: 5);
    } else {
      return const EdgeInsets.symmetric(horizontal: 12, vertical: 2);
    }
  }

  double getElevation(index) {
    if (index == 1) {
      return 5.0;
    } else if (index == 2) {
      return 4.0;
    } else if (index == 3) {
      return 3.0;
    } else {
      return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: getMargin(index),
      elevation: getElevation(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Student_0$index".toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins'),
                        ),
                        const SizedBox(
                          height: 1.5,
                        ),
                        Text(
                          "Score : 000",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[200]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              index < 2
                  ? const Image(
                      height: 45,
                      width: 45,
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/2641/2641497.png'),
                    )
                  : const Image(height: 40, width: 40, image: NetworkImage(

                      // 'https://cdn-icons-png.flaticon.com/512/3557/3557510.png'
                      'https://cdn-icons-png.flaticon.com/512/477/477406.png'))
            ],
          )),
    );
  }
}
