import 'package:flutter/material.dart';

class InputSpace extends StatelessWidget {
  final String? letter;
  function() {}

  final double variable = 30;
  const InputSpace(this.letter, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: SizedBox(
        width: variable,
        height: variable,
        child: FloatingActionButton(
          onPressed: () {
            function;
          },
          backgroundColor: Colors.grey,
          child: Text(letter ?? ""),
        ),
      ),
    );
  }
}
