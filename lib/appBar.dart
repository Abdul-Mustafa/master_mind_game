import "package:flutter/material.dart";

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        title: Text("Master Mind Game"),
      ),
    );
  }
}
