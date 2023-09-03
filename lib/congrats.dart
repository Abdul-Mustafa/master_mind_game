import 'package:flutter/material.dart';

class Congrats extends StatelessWidget {
  final Function ok;
  final String score;
  const Congrats(this.ok, this.score, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Congrats You Have Won The Game"),
            Text("Your Score is: $score")
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
