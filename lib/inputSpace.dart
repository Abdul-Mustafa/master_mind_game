import 'package:flutter/material.dart';

class InputSpace extends StatelessWidget {
  String? letter;

  double variable = 30;
  InputSpace(this.letter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Stack(
        children: [
          Container(
            width: variable,
            height: variable,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: Colors.black, width: 2), // Set the border radius here
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 1, left: 10),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                letter ?? "",
                style: TextStyle(
                    fontSize: variable * 0.625,
                    color: Colors.blue,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
