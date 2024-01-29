import 'package:flutter/material.dart';

class DialogAlert extends StatelessWidget {
  // WIDGET: DIALOG ALERT
  const DialogAlert(
      {required this.title,
      required this.description,
      required this.actions,
      Key? key})
      : super(key: key);

  final List<TextButton> actions;
  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      content: Text(
        description,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
      actions: actions,
    );
  }
}
