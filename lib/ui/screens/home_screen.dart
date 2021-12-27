import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_flutter/ui/screens/food_screen.dart';
import 'package:glassmorphism_flutter/ui/screens/profile_screen.dart';
import 'package:glassmorphism_flutter/ui/widgets/glass.dart';
import 'package:glassmorphism_flutter/ui/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final _bottomNavPages = const <Widget>[
    HomeScreenBody(),
    FoodScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _bottomNavPages[_currentIndex],
      bottomNavigationBar: GlassMorphism(
        start: .3,
        end: .3,
        borderRadius: 30,
        child: BottomNavyBar(
          showElevation: false,
          selectedIndex: _currentIndex,
          backgroundColor: Colors.transparent,
          onItemSelected: (value) => setState(() {
            _currentIndex = value;
          }),
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: Colors.white,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.food_bank),
              title: const Text('Food'),
              activeColor: Colors.white,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.account_circle),
              title: const Text(
                'Messages test for mes teset test test ',
              ),
              activeColor: Colors.white,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
