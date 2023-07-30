import 'outputWhite.dart';
import 'outputBlack.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'button.dart';
import 'inputSpace.dart';
import 'indexing.dart';
import 'congrats.dart';

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
  List<String?> list = List.filled(40, null);
  List<String> computer_guessed_letters_list = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      computer_guessed_letters_list.add(letter_list[Random().nextInt(12)]);
    }
    print(computer_guessed_letters_list);
  }

  onPress(letter) {
    setState(() {
      if (horizontalCounter % 4 != 0 ||
          horizontalCounter < 4 ||
          submitted == true && list[39] == null ||
          my_guessed_letter_list.isEmpty) {
        list[horizontalCounter] = letter;
        horizontalCounter += 1;
        my_guessed_letter_list.add(letter);
        submitted = false;
      }
    });
  }

  removeButton() {
    setState(() {
      if (submitted == false && my_guessed_letter_list.isNotEmpty) {
        list[horizontalCounter - 1] = null;
        my_guessed_letter_list.removeLast();
        horizontalCounter -= 1;
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
  }

  restart() {
    setState(() {
      row = 0;
      contains = 0;
      at_place = 0;
      horizontalCounter = 0;
      submitted = false;
      rendering_Bullets = {};
      my_guessed_letter_list = [];
      computer_guessed_letters_list = [];
      list = List.filled(40, null);
      for (int i = 0; i < 4; i++) {
        computer_guessed_letters_list.add(letter_list[Random().nextInt(12)]);
      }
    });
    print(computer_guessed_letters_list);
  }

  ok() {
    restart();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (rendering_Bullets.values
                .any((innerMap) => innerMap.containsValue(4)))
              Congrats(ok),
            if (!rendering_Bullets.values
                .any((innerMap) => innerMap.containsValue(4)))
              Expanded(
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        for (int i = 0; i < letter_list.length; i++)
                          Button(letter_list[i], onPress)
                      ],
                    ),
                    Row(
                      children: [
                        Index("01"),
                        InputSpace(list[0]),
                        InputSpace(list[1]),
                        InputSpace(list[2]),
                        InputSpace(list[3]),
                        if ((rendering_Bullets[1]?['black'] ?? 0) > 0)
                          const OutputBlack(),
                        if ((rendering_Bullets[1]?['black'] ?? 0) > 1)
                          const OutputBlack(),
                        if ((rendering_Bullets[1]?['black'] ?? 0) > 2)
                          const OutputBlack(),
                        if ((rendering_Bullets[1]?['black'] ?? 0) > 3)
                          const OutputBlack(),
                        if ((rendering_Bullets[1]?['white'] ?? 0) > 0)
                          const OutputWhite(),
                        if ((rendering_Bullets[1]?['white'] ?? 0) > 1)
                          const OutputWhite(),
                        if ((rendering_Bullets[1]?['white'] ?? 0) > 2)
                          const OutputWhite(),
                        if ((rendering_Bullets[1]?['white'] ?? 0) > 3)
                          const OutputWhite(),
                      ],
                    ),
                    Row(
                      children: [
                        Index("02"),
                        InputSpace(list[4]),
                        InputSpace(list[5]),
                        InputSpace(list[6]),
                        InputSpace(list[7]),
                        if ((rendering_Bullets[2]?['black'] ?? 0) > 0)
                          const OutputBlack(),
                        if ((rendering_Bullets[2]?['black'] ?? 0) > 1)
                          const OutputBlack(),
                        if ((rendering_Bullets[2]?['black'] ?? 0) > 2)
                          const OutputBlack(),
                        if ((rendering_Bullets[2]?['black'] ?? 0) > 3)
                          const OutputBlack(),
                        if ((rendering_Bullets[2]?['white'] ?? 0) > 0)
                          const OutputWhite(),
                        if ((rendering_Bullets[2]?['white'] ?? 0) > 1)
                          const OutputWhite(),
                        if ((rendering_Bullets[2]?['white'] ?? 0) > 2)
                          const OutputWhite(),
                        if ((rendering_Bullets[2]?['white'] ?? 0) > 3)
                          const OutputWhite(),
                      ],
                    ),
                    Row(
                      children: [
                        Index("03"),
                        InputSpace(list[8]),
                        InputSpace(list[9]),
                        InputSpace(list[10]),
                        InputSpace(list[11]),
                        if ((rendering_Bullets[3]?['black'] ?? 0) > 0)
                          const OutputBlack(),
                        if ((rendering_Bullets[3]?['black'] ?? 0) > 1)
                          const OutputBlack(),
                        if ((rendering_Bullets[3]?['black'] ?? 0) > 2)
                          const OutputBlack(),
                        if ((rendering_Bullets[3]?['black'] ?? 0) > 3)
                          const OutputBlack(),
                        if ((rendering_Bullets[3]?['white'] ?? 0) > 0)
                          const OutputWhite(),
                        if ((rendering_Bullets[3]?['white'] ?? 0) > 1)
                          const OutputWhite(),
                        if ((rendering_Bullets[3]?['white'] ?? 0) > 2)
                          const OutputWhite(),
                        if ((rendering_Bullets[3]?['white'] ?? 0) > 3)
                          const OutputWhite(),
                      ],
                    ),
                    Row(
                      children: [
                        Index("04"),
                        InputSpace(list[12]),
                        InputSpace(list[13]),
                        InputSpace(list[14]),
                        InputSpace(list[15]),
                        if ((rendering_Bullets[4]?['black'] ?? 0) > 0)
                          const OutputBlack(),
                        if ((rendering_Bullets[4]?['black'] ?? 0) > 1)
                          const OutputBlack(),
                        if ((rendering_Bullets[4]?['black'] ?? 0) > 2)
                          const OutputBlack(),
                        if ((rendering_Bullets[4]?['black'] ?? 0) > 3)
                          const OutputBlack(),
                        if ((rendering_Bullets[4]?['white'] ?? 0) > 0)
                          const OutputWhite(),
                        if ((rendering_Bullets[4]?['white'] ?? 0) > 1)
                          const OutputWhite(),
                        if ((rendering_Bullets[4]?['white'] ?? 0) > 2)
                          const OutputWhite(),
                        if ((rendering_Bullets[4]?['white'] ?? 0) > 3)
                          const OutputWhite(),
                      ],
                    ),
                    Row(
                      children: [
                        Index("05"),
                        InputSpace(list[16]),
                        InputSpace(list[17]),
                        InputSpace(list[18]),
                        InputSpace(list[19]),
                        if ((rendering_Bullets[5]?['black'] ?? 0) > 0)
                          const OutputBlack(),
                        if ((rendering_Bullets[5]?['black'] ?? 0) > 1)
                          const OutputBlack(),
                        if ((rendering_Bullets[5]?['black'] ?? 0) > 2)
                          const OutputBlack(),
                        if ((rendering_Bullets[5]?['black'] ?? 0) > 3)
                          const OutputBlack(),
                        if ((rendering_Bullets[5]?['white'] ?? 0) > 0)
                          const OutputWhite(),
                        if ((rendering_Bullets[5]?['white'] ?? 0) > 1)
                          const OutputWhite(),
                        if ((rendering_Bullets[5]?['white'] ?? 0) > 2)
                          const OutputWhite(),
                        if ((rendering_Bullets[5]?['white'] ?? 0) > 3)
                          const OutputWhite(),
                      ],
                    ),
                    Row(
                      children: [
                        Index("06"),
                        InputSpace(list[20]),
                        InputSpace(list[21]),
                        InputSpace(list[22]),
                        InputSpace(list[23]),
                        if ((rendering_Bullets[6]?['black'] ?? 0) > 0)
                          const OutputBlack(),
                        if ((rendering_Bullets[6]?['black'] ?? 0) > 1)
                          const OutputBlack(),
                        if ((rendering_Bullets[6]?['black'] ?? 0) > 2)
                          const OutputBlack(),
                        if ((rendering_Bullets[6]?['black'] ?? 0) > 3)
                          const OutputBlack(),
                        if ((rendering_Bullets[6]?['white'] ?? 0) > 0)
                          const OutputWhite(),
                        if ((rendering_Bullets[6]?['white'] ?? 0) > 1)
                          const OutputWhite(),
                        if ((rendering_Bullets[6]?['white'] ?? 0) > 2)
                          const OutputWhite(),
                        if ((rendering_Bullets[6]?['white'] ?? 0) > 3)
                          const OutputWhite(),
                      ],
                    ),
                    Row(
                      children: [
                        Index("07"),
                        InputSpace(list[24]),
                        InputSpace(list[25]),
                        InputSpace(list[26]),
                        InputSpace(list[27]),
                        if ((rendering_Bullets[7]?['black'] ?? 0) > 0)
                          const OutputBlack(),
                        if ((rendering_Bullets[7]?['black'] ?? 0) > 1)
                          const OutputBlack(),
                        if ((rendering_Bullets[7]?['black'] ?? 0) > 2)
                          const OutputBlack(),
                        if ((rendering_Bullets[7]?['black'] ?? 0) > 3)
                          const OutputBlack(),
                        if ((rendering_Bullets[7]?['white'] ?? 0) > 0)
                          const OutputWhite(),
                        if ((rendering_Bullets[7]?['white'] ?? 0) > 1)
                          const OutputWhite(),
                        if ((rendering_Bullets[7]?['white'] ?? 0) > 2)
                          const OutputWhite(),
                        if ((rendering_Bullets[7]?['white'] ?? 0) > 3)
                          const OutputWhite(),
                      ],
                    ),
                    Row(
                      children: [
                        Index("08"),
                        InputSpace(list[28]),
                        InputSpace(list[29]),
                        InputSpace(list[30]),
                        InputSpace(list[31]),
                        if ((rendering_Bullets[8]?['black'] ?? 0) > 0)
                          const OutputBlack(),
                        if ((rendering_Bullets[8]?['black'] ?? 0) > 1)
                          const OutputBlack(),
                        if ((rendering_Bullets[8]?['black'] ?? 0) > 2)
                          const OutputBlack(),
                        if ((rendering_Bullets[8]?['black'] ?? 0) > 3)
                          const OutputBlack(),
                        if ((rendering_Bullets[8]?['white'] ?? 0) > 0)
                          const OutputWhite(),
                        if ((rendering_Bullets[8]?['white'] ?? 0) > 1)
                          const OutputWhite(),
                        if ((rendering_Bullets[8]?['white'] ?? 0) > 2)
                          const OutputWhite(),
                        if ((rendering_Bullets[8]?['white'] ?? 0) > 3)
                          const OutputWhite(),
                      ],
                    ),
                    Row(
                      children: [
                        Index("09"),
                        InputSpace(list[32]),
                        InputSpace(list[33]),
                        InputSpace(list[34]),
                        InputSpace(list[35]),
                        if ((rendering_Bullets[9]?['black'] ?? 0) > 0)
                          const OutputBlack(),
                        if ((rendering_Bullets[9]?['black'] ?? 0) > 1)
                          const OutputBlack(),
                        if ((rendering_Bullets[9]?['black'] ?? 0) > 2)
                          const OutputBlack(),
                        if ((rendering_Bullets[9]?['black'] ?? 0) > 3)
                          const OutputBlack(),
                        if ((rendering_Bullets[9]?['white'] ?? 0) > 0)
                          const OutputWhite(),
                        if ((rendering_Bullets[9]?['white'] ?? 0) > 1)
                          const OutputWhite(),
                        if ((rendering_Bullets[9]?['white'] ?? 0) > 2)
                          const OutputWhite(),
                        if ((rendering_Bullets[9]?['white'] ?? 0) > 3)
                          const OutputWhite(),
                      ],
                    ),
                    Row(
                      children: [
                        Index("10"),
                        InputSpace(list[36]),
                        InputSpace(list[37]),
                        InputSpace(list[38]),
                        InputSpace(list[39]),
                        if ((rendering_Bullets[10]?['black'] ?? 0) > 0)
                          const OutputBlack(),
                        if ((rendering_Bullets[10]?['black'] ?? 0) > 1)
                          const OutputBlack(),
                        if ((rendering_Bullets[10]?['black'] ?? 0) > 2)
                          const OutputBlack(),
                        if ((rendering_Bullets[10]?['black'] ?? 0) > 3)
                          const OutputBlack(),
                        if ((rendering_Bullets[10]?['white'] ?? 0) > 0)
                          const OutputWhite(),
                        if ((rendering_Bullets[10]?['white'] ?? 0) > 1)
                          const OutputWhite(),
                        if ((rendering_Bullets[10]?['white'] ?? 0) > 2)
                          const OutputWhite(),
                        if ((rendering_Bullets[10]?['white'] ?? 0) > 3)
                          const OutputWhite(),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          onPressed: () {
                            restart();
                          },
                          child: Text("Restart"),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {
                            removeButton();
                          },
                          child: Text("Remove"),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            submit();
                          },
                          child: Text("Submit"),
                        ),
                        const Spacer(),
                        const Spacer()
                      ],
                    ),
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
