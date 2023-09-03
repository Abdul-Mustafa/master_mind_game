import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HighScore extends StatefulWidget {
  const HighScore({super.key});
  _HighScoreState createState() => _HighScoreState();
}

class _HighScoreState extends State<HighScore> {
  dynamic myData = "";

  @override
  void initState() {
    super.initState();
    _getDataFromSharedPreferences();
  }

  Future<void> _getDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myData = prefs.getKeys(); // Replace 'key_name' with your actual key.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('High Score')),
      body: Center(
        child: Text('$myData'),
      ),
    );
  }
}
