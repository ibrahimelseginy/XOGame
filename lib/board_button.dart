import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  String text;
  void Function(int) onButtonClicked;
  int index;

  BoardButton(
      {super.key,
      required this.text,
      required this.onButtonClicked,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: ElevatedButton(
        onPressed: () {
          onButtonClicked(index);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
