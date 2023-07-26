import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String letter;
  final Function onButonPress;

  const Button(this.letter, this.onButonPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius:
                  BorderRadius.circular(100), // Set the border radius here
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 1, left: 10),
            child: GestureDetector(
              onTap: () {
                onButonPress(letter);
              },
              child: Text(
                letter,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
