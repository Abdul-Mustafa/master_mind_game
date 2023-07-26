import 'package:flutter/material.dart';

class OutputWhite extends StatelessWidget {
  double variable = 15;
  OutputWhite({super.key});

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
        ],
      ),
    );
  }
}
