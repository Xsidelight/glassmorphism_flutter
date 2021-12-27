import 'package:flutter/material.dart';
import 'package:glassmorphism_flutter/ui/widgets/glass.dart';
import 'package:glassmorphism_flutter/ui/widgets/glass_container.dart';
import 'package:glassmorphism_flutter/ui/widgets/hs_glass_card.dart';
import 'package:glassmorphism_flutter/ui/widgets/path_painter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.fitHeight,
            height: double.infinity,
          ),
          GlassMorphism(
            start: .3,
            end: .3,
            borderRadius: 10,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 15, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Welcome to \nGlassFit!',
                        style: TextStyle(fontSize: 30),
                      ),
                      CircleAvatar(
                        radius: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Steps:',
                      ),
                      RichText(
                        text: const TextSpan(
                          text: '1250',
                          style: TextStyle(fontSize: 120),
                          children: [
                            TextSpan(
                              text: '/10000',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: const [
                            HomeScreenGlassCard(
                                title: 'Training',
                                definition: 'hours',
                                value: '15:33'),
                            SizedBox(
                              height: 15,
                            ),
                            HomeScreenGlassCard(
                                title: 'Distance',
                                definition: 'Kilometters',
                                value: '12'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: GlassContainer(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Heart Rate',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: CustomPaint(
                                    painter: ChartPainter(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: const [
                                      Text('BMP: 111'),
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlassMorphism(
        start: .3,
        end: .3,
        borderRadius: 30,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              label: 'Smt',
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: 'Smt',
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: 'Smt',
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
