import 'package:flutter/material.dart';

class Congrats extends StatelessWidget {
  final Function ok;
  const Congrats(this.ok, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Congrats You Have Won The Game"),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ok();
              },
              child: const Text("Start New Game"),
            ),
          ],
        )
      ],
    );
  }
}
