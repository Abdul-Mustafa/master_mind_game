import 'package:flutter/material.dart';

class OutputWhite extends StatelessWidget {
  final double variable = 15;
  const OutputWhite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Container(
        margin: const EdgeInsets.all(5),
        child: SizedBox(
          width: 15.0,
          height: 15.0,
          child: FloatingActionButton(
            onPressed: () {
              onButonPress() {}
              ;
            },
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
