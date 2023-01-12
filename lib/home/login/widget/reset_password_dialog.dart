import 'package:flutter/material.dart';

import 'input_card.dart';

class ResetPasswordDialog extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback positiveCallback;
  final VoidCallback negativeCallback;

  const ResetPasswordDialog(
      {Key? key,
      required this.positiveCallback,
      required this.negativeCallback, required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actionsPadding: const EdgeInsets.only(bottom: 10, right: 15),
      title: const Text('Reset Password'),
      content: InputCard(
          label: 'Email',
          hint: 'email id',
          isPassword: false,
          controller: textController),
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: negativeCallback,
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: positiveCallback,
          child: const Text('Reset'),
        ),
      ],
    );
  }
}
