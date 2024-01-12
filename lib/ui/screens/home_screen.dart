import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_flutter/ui/screens/meal_screen.dart';
import 'package:glassmorphism_flutter/ui/screens/profile_screen.dart';
import 'package:glassmorphism_flutter/ui/widgets/background_image.dart';
import 'package:glassmorphism_flutter/ui/widgets/glass.dart';
import 'package:glassmorphism_flutter/ui/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final _bottomNavPages = const <Widget>[
    HomeScreenBody(),
    MealScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  late PageController _pageController;
  late double _pageOffset;

  @override
  void initState() {
    super.initState();
    _pageOffset = 0;
    _pageController = PageController(
      initialPage: 0,
    );
    _pageController.addListener(
      () => setState(() {
        _pageOffset = _pageController.page ?? 0;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          BackgroundImage(
            pageCount: _bottomNavPages.length + 1,
            screenSize: screenSize,
            offset: _pageOffset,
          ),
          GlassMorphism(
            start: .3,
            end: .3,
            borderRadius: 10,
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _bottomNavPages,
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlassMorphism(
        start: .3,
        end: .3,
        borderRadius: 30,
        child: BottomNavyBar(
          showElevation: false,
          selectedIndex: _currentIndex,
          backgroundColor: Colors.transparent,
          onItemSelected: (value) => setState(() {
            _pageController.animateToPage(value,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
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
              title: const Text('Meal'),
              activeColor: Colors.white,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.account_circle),
              title: const Text(
                'Messages test for mes test test test ',
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
