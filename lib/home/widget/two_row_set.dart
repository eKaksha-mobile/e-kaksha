import 'package:flutter/material.dart';

class IndividualRowSet extends StatelessWidget {
  const IndividualRowSet(
      {Key? key,
      required this.t1,
      required this.t2,
      required this.t1OnTap,
      required this.t2OnTap,
      this.t1Icon = Icons.priority_high,
      this.t2Icon = Icons.priority_high})
      : super(key: key);

  final String t1;
  final IconData t1Icon;
  final VoidCallback t1OnTap;
  final IconData t2Icon;
  final String t2;
  final VoidCallback t2OnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: GestureDetector(
          onTap: t1OnTap,
          child: ContainerBox(
            colour: Colors.orange,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  t1Icon,
                  size: 35,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  t1,
                  style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: t2OnTap,
          child: ContainerBox(
            colour: Colors.orange,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  t2Icon,
                  size: 35,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  t2,
                  style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}

class ContainerBox extends StatelessWidget {
  ContainerBox({required this.colour, this.cardChild});

  final Color colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      decoration: BoxDecoration(
          color: colour,
          image: const DecorationImage(
              image: AssetImage('assets/images/banner1.jpg'),
              fit: BoxFit.cover),
          boxShadow: const [
            BoxShadow(
              color: Colors.black87,
              blurRadius: 3.0,
              spreadRadius: 1.0,
              offset: Offset(1.5, 1.5), // shadow direction: bottom right
            )
          ],
          borderRadius: BorderRadius.circular(15.0)),
      child: cardChild,
    );
  }
}
