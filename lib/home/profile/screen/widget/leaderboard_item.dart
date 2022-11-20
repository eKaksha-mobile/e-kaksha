import 'package:flutter/material.dart';

class LeaderboadItems extends StatelessWidget {
  LeaderboadItems({this.index = 0, super.key});
  late int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: index < 2
            ? const EdgeInsets.symmetric(horizontal: 7, vertical: 2)
            : const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1.5, 2.0),
                  blurRadius: 1.0,
                  spreadRadius: 1.0)
            ],
            color: Colors.grey[100],
            // color: oceanBlue,
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
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
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 1.5,
                      ),
                      Text(
                        "Score : 000",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
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
        ));
  }
}
