import 'package:flutter/material.dart';
import 'main_page.dart';
import 'highScore.dart';

void main() => runApp(const BottomNavigator());

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int bottomIndex = 0;
  final PageController _pageController = PageController();
  List<Widget> pages = [MyApp(), HighScore()];
  bottomNavigator(index) {
    setState(() {
      bottomIndex = index;
      _pageController.jumpToPage(index);
    });
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
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              bottomIndex = index;
            });
          },
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts_outlined),
              label: 'Hight Score',
            ),
          ],
          currentIndex: bottomIndex,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            bottomNavigator(index);
          },
        ),
      ),
    );
  }
}
