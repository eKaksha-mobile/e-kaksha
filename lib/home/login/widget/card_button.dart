import 'package:flutter/material.dart';

import '../../../utils/value/style.dart';

class CardButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;

  const CardButton({Key? key, required this.title, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      width: mediaQuery.size.width * 0.75,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
      ),
      child: Text(title,style: textStyle5,),
    );
  }
}
