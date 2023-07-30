import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  final String index;
  const Index(this.index, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Text(
        index,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
