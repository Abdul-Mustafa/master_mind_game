import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String letter;
  final Function onButonPress;

  const Button(this.letter, this.onButonPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 40.0,
        height: 40.0,
        child: FloatingActionButton(
          onPressed: () {
            onButonPress(letter);
          },
          child: Text(letter),
        ),
      ),
    );
  }
}
