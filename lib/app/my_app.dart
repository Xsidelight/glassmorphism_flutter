import 'package:flutter/material.dart';
import 'package:glassmorphism_flutter/ui/screens/home_screen.dart';

class GlassmorphismApp extends StatelessWidget {
  const GlassmorphismApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glass Health',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
