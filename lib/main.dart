import 'outputWhite.dart';
import 'outputBlack.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'button.dart';
import 'inputSpace.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int row = 0;
  int contains = 0;
  int at_place = 0;
  int horizontalCounter = 0;
  bool submitted = false;
  Map<int, Map> rendering_Bullets = {};
  List<String> my_guessed_letter_list = [];
  List<String> letter_list = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L"
  ];
  List list = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ];
  late List<String> computer_guessed_letters_list;

  @override
  void initState() {
    super.initState();
    int index0 = Random().nextInt(12);
    int index1 = Random().nextInt(12);
    int index2 = Random().nextInt(12);
    int index3 = Random().nextInt(12);
    computer_guessed_letters_list = [
      letter_list[index0],
      letter_list[index1],
      letter_list[index2],
      letter_list[index3],
    ];
  }

  onPress(letter) {
    setState(() {
      if (horizontalCounter % 4 != 0 ||
          horizontalCounter < 4 ||
          submitted == true && list[39] == null) {
        list[horizontalCounter] = letter;
        horizontalCounter += 1;
        my_guessed_letter_list.add(letter);
        submitted = false;
        // print(list);
        // print(list.length);
        // print(my_guessed_letter_list);
      }
    });
    print(list.length);
  }

  removeButton() {
    setState(() {
      if (horizontalCounter > 0 && submitted == false) {
        list[horizontalCounter - 1] = null;
        my_guessed_letter_list.removeLast();
        horizontalCounter -= 1;
        // print(list);
        // print(list.length);
      }
    });
  }

  submit() {
    setState(() {
      if (horizontalCounter % 4 == 0 &&
          horizontalCounter != 0 &&
          submitted == false) {
        for (int i = 0; i < my_guessed_letter_list.length; i++) {
          if (computer_guessed_letters_list
              .contains(my_guessed_letter_list[i])) {
            contains += 1;
            if (my_guessed_letter_list[i] == computer_guessed_letters_list[i]) {
              at_place += 1;
              contains -= 1;
            }
          }
        }
        row += 1;
        rendering_Bullets[row] = <String, int>{
          "black": at_place,
          "white": contains
        };
        my_guessed_letter_list = [];
        at_place = 0;
        contains = 0;
      }
    });

    submitted = true;
    // print("at_place:$at_place and contains:$contains");
    // print(computer_guessed_letters_list);
    // print("Row: $row");
    print(rendering_Bullets);
    print(computer_guessed_letters_list);
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'Flutter Hello World',

      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: Scaffold(
        appBar: AppBar(
          title: Text('Master Mind Game'),
        ),
        body: Column(
          children: [
            Wrap(
              children: [
                Button("A", onPress),
                Button("B", onPress),
                Button("C", onPress),
                Button("D", onPress),
                Button("E", onPress),
                Button("F", onPress),
                Button("G", onPress),
                Button("H", onPress),
                Button("I", onPress),
                Button("J", onPress),
                Button("K", onPress),
                Button("L", onPress),
              ],
            ),
            Row(
              children: [
                Text(
                  "01.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InputSpace(list[0]),
                InputSpace(list[1]),
                InputSpace(list[2]),
                InputSpace(list[3]),
                if ((rendering_Bullets[1]?['black'] ?? 0) > 0) OutputBlack(),
                if ((rendering_Bullets[1]?['black'] ?? 0) > 1) OutputBlack(),
                if ((rendering_Bullets[1]?['black'] ?? 0) > 2) OutputBlack(),
                if ((rendering_Bullets[1]?['black'] ?? 0) > 3) OutputBlack(),
                if ((rendering_Bullets[1]?['white'] ?? 0) > 0) OutputWhite(),
                if ((rendering_Bullets[1]?['white'] ?? 0) > 1) OutputWhite(),
                if ((rendering_Bullets[1]?['white'] ?? 0) > 2) OutputWhite(),
                if ((rendering_Bullets[1]?['white'] ?? 0) > 3) OutputWhite(),
              ],
            ),
            Row(
              children: [
                Text(
                  "02.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InputSpace(list[4]),
                InputSpace(list[5]),
                InputSpace(list[6]),
                InputSpace(list[7]),
                if ((rendering_Bullets[2]?['black'] ?? 0) > 0) OutputBlack(),
                if ((rendering_Bullets[2]?['black'] ?? 0) > 1) OutputBlack(),
                if ((rendering_Bullets[2]?['black'] ?? 0) > 2) OutputBlack(),
                if ((rendering_Bullets[2]?['black'] ?? 0) > 3) OutputBlack(),
                if ((rendering_Bullets[2]?['white'] ?? 0) > 0) OutputWhite(),
                if ((rendering_Bullets[2]?['white'] ?? 0) > 1) OutputWhite(),
                if ((rendering_Bullets[2]?['white'] ?? 0) > 2) OutputWhite(),
                if ((rendering_Bullets[2]?['white'] ?? 0) > 3) OutputWhite(),
              ],
            ),
            Row(
              children: [
                Text(
                  "03.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InputSpace(list[8]),
                InputSpace(list[9]),
                InputSpace(list[10]),
                InputSpace(list[11]),
                if ((rendering_Bullets[3]?['black'] ?? 0) > 0) OutputBlack(),
                if ((rendering_Bullets[3]?['black'] ?? 0) > 1) OutputBlack(),
                if ((rendering_Bullets[3]?['black'] ?? 0) > 2) OutputBlack(),
                if ((rendering_Bullets[3]?['black'] ?? 0) > 3) OutputBlack(),
                if ((rendering_Bullets[3]?['white'] ?? 0) > 0) OutputWhite(),
                if ((rendering_Bullets[3]?['white'] ?? 0) > 1) OutputWhite(),
                if ((rendering_Bullets[3]?['white'] ?? 0) > 2) OutputWhite(),
                if ((rendering_Bullets[3]?['white'] ?? 0) > 3) OutputWhite(),
              ],
            ),
            Row(
              children: [
                Text(
                  "04.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InputSpace(list[12]),
                InputSpace(list[13]),
                InputSpace(list[14]),
                InputSpace(list[15]),
                if ((rendering_Bullets[4]?['black'] ?? 0) > 0) OutputBlack(),
                if ((rendering_Bullets[4]?['black'] ?? 0) > 1) OutputBlack(),
                if ((rendering_Bullets[4]?['black'] ?? 0) > 2) OutputBlack(),
                if ((rendering_Bullets[4]?['black'] ?? 0) > 3) OutputBlack(),
                if ((rendering_Bullets[4]?['white'] ?? 0) > 0) OutputWhite(),
                if ((rendering_Bullets[4]?['white'] ?? 0) > 1) OutputWhite(),
                if ((rendering_Bullets[4]?['white'] ?? 0) > 2) OutputWhite(),
                if ((rendering_Bullets[4]?['white'] ?? 0) > 3) OutputWhite(),
              ],
            ),
            Row(
              children: [
                Text(
                  "05.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InputSpace(list[16]),
                InputSpace(list[17]),
                InputSpace(list[18]),
                InputSpace(list[19]),
                if ((rendering_Bullets[5]?['black'] ?? 0) > 0) OutputBlack(),
                if ((rendering_Bullets[5]?['black'] ?? 0) > 1) OutputBlack(),
                if ((rendering_Bullets[5]?['black'] ?? 0) > 2) OutputBlack(),
                if ((rendering_Bullets[5]?['black'] ?? 0) > 3) OutputBlack(),
                if ((rendering_Bullets[5]?['white'] ?? 0) > 0) OutputWhite(),
                if ((rendering_Bullets[5]?['white'] ?? 0) > 1) OutputWhite(),
                if ((rendering_Bullets[5]?['white'] ?? 0) > 2) OutputWhite(),
                if ((rendering_Bullets[5]?['white'] ?? 0) > 3) OutputWhite(),
              ],
            ),
            Row(
              children: [
                Text(
                  "06.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InputSpace(list[20]),
                InputSpace(list[21]),
                InputSpace(list[22]),
                InputSpace(list[23]),
                if ((rendering_Bullets[6]?['black'] ?? 0) > 0) OutputBlack(),
                if ((rendering_Bullets[6]?['black'] ?? 0) > 1) OutputBlack(),
                if ((rendering_Bullets[6]?['black'] ?? 0) > 2) OutputBlack(),
                if ((rendering_Bullets[6]?['black'] ?? 0) > 3) OutputBlack(),
                if ((rendering_Bullets[6]?['white'] ?? 0) > 0) OutputWhite(),
                if ((rendering_Bullets[6]?['white'] ?? 0) > 1) OutputWhite(),
                if ((rendering_Bullets[6]?['white'] ?? 0) > 2) OutputWhite(),
                if ((rendering_Bullets[6]?['white'] ?? 0) > 3) OutputWhite(),
              ],
            ),
            Row(
              children: [
                Text(
                  "07.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InputSpace(list[24]),
                InputSpace(list[25]),
                InputSpace(list[26]),
                InputSpace(list[27]),
                if ((rendering_Bullets[7]?['black'] ?? 0) > 0) OutputBlack(),
                if ((rendering_Bullets[7]?['black'] ?? 0) > 1) OutputBlack(),
                if ((rendering_Bullets[7]?['black'] ?? 0) > 2) OutputBlack(),
                if ((rendering_Bullets[7]?['black'] ?? 0) > 3) OutputBlack(),
                if ((rendering_Bullets[7]?['white'] ?? 0) > 0) OutputWhite(),
                if ((rendering_Bullets[7]?['white'] ?? 0) > 1) OutputWhite(),
                if ((rendering_Bullets[7]?['white'] ?? 0) > 2) OutputWhite(),
                if ((rendering_Bullets[7]?['white'] ?? 0) > 3) OutputWhite(),
              ],
            ),
            Row(
              children: [
                Text(
                  "08.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InputSpace(list[28]),
                InputSpace(list[29]),
                InputSpace(list[30]),
                InputSpace(list[31]),
                if ((rendering_Bullets[8]?['black'] ?? 0) > 0) OutputBlack(),
                if ((rendering_Bullets[8]?['black'] ?? 0) > 1) OutputBlack(),
                if ((rendering_Bullets[8]?['black'] ?? 0) > 2) OutputBlack(),
                if ((rendering_Bullets[8]?['black'] ?? 0) > 3) OutputBlack(),
                if ((rendering_Bullets[8]?['white'] ?? 0) > 0) OutputWhite(),
                if ((rendering_Bullets[8]?['white'] ?? 0) > 1) OutputWhite(),
                if ((rendering_Bullets[8]?['white'] ?? 0) > 2) OutputWhite(),
                if ((rendering_Bullets[8]?['white'] ?? 0) > 3) OutputWhite(),
              ],
            ),
            Row(
              children: [
                Text(
                  "09.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InputSpace(list[32]),
                InputSpace(list[33]),
                InputSpace(list[34]),
                InputSpace(list[35]),
                if ((rendering_Bullets[9]?['black'] ?? 0) > 0) OutputBlack(),
                if ((rendering_Bullets[9]?['black'] ?? 0) > 1) OutputBlack(),
                if ((rendering_Bullets[9]?['black'] ?? 0) > 2) OutputBlack(),
                if ((rendering_Bullets[9]?['black'] ?? 0) > 3) OutputBlack(),
                if ((rendering_Bullets[9]?['white'] ?? 0) > 0) OutputWhite(),
                if ((rendering_Bullets[9]?['white'] ?? 0) > 1) OutputWhite(),
                if ((rendering_Bullets[9]?['white'] ?? 0) > 2) OutputWhite(),
                if ((rendering_Bullets[9]?['white'] ?? 0) > 3) OutputWhite(),
              ],
            ),
            Row(
              children: [
                Text(
                  "10.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InputSpace(list[36]),
                InputSpace(list[37]),
                InputSpace(list[38]),
                InputSpace(list[39]),
                if ((rendering_Bullets[10]?['black'] ?? 0) > 0) OutputBlack(),
                if ((rendering_Bullets[10]?['black'] ?? 0) > 1) OutputBlack(),
                if ((rendering_Bullets[10]?['black'] ?? 0) > 2) OutputBlack(),
                if ((rendering_Bullets[10]?['black'] ?? 0) > 3) OutputBlack(),
                if ((rendering_Bullets[10]?['white'] ?? 0) > 0) OutputWhite(),
                if ((rendering_Bullets[10]?['white'] ?? 0) > 1) OutputWhite(),
                if ((rendering_Bullets[10]?['white'] ?? 0) > 2) OutputWhite(),
                if ((rendering_Bullets[10]?['white'] ?? 0) > 3) OutputWhite(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    removeButton();
                  },
                  child: Text("Remove"),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    submit();
                  },
                  child: Text("Submit"),
                ),
                Spacer(),
                Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
