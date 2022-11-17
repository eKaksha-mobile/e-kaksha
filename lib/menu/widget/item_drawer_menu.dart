import 'package:flutter/material.dart';

import '../../utils/widget/horizontal_spacer.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData _icon;
  final String _title;
  final VoidCallback _callback;

  const DrawerMenuItem(
      {required icon, required title, required callback, Key? key})
      : _icon = icon,
        _title = title,
        _callback = callback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _callback,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              _icon,
              size: 20,
            ),
            const HorizontalSpacer(15),
            Text(
              _title,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
