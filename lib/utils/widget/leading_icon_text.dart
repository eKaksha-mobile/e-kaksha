import 'package:flutter/material.dart';

import 'horizontal_spacer.dart';

class LeadingIconText extends StatelessWidget {
  final IconData _icon;

  final String _label;

  final double _iconSize;
  final double _labelSize;
  final double _iconSpacing;
  final double _verticalMargin;
  final double _horizontalMargin;
  final double _labelHeight;

  final Color _iconColor;
  final Color _labelColor;

  final VoidCallback _callback;

  static void _doNothing() {}

  const LeadingIconText(
      {required icon,
      required label,
      callback = _doNothing,
      iconSize = 20.0,
      labelSize = 18.0,
      iconSpacing = 15.0,
      verticalMargin = 10.0,
      horizontalMargin = 15.0,
      labelHeight = 1.0,
      iconColor = Colors.black,
      labelColor = Colors.black,
      Key? key})
      : _icon = icon,
        _label = label,
        _callback = callback,
        _iconSize = iconSize,
        _labelSize = labelSize,
        _iconSpacing = iconSpacing,
        _verticalMargin = verticalMargin,
        _horizontalMargin = horizontalMargin,
        _labelHeight = labelHeight,
        _iconColor = iconColor,
        _labelColor = labelColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: _callback,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: _verticalMargin, horizontal: _horizontalMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              _icon,
              size: _iconSize,
              color: _iconColor,
            ),
            HorizontalSpacer(_iconSpacing),
            Text(
              _label,
              style: TextStyle(
                color: _labelColor,
                fontSize: _labelSize,
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
