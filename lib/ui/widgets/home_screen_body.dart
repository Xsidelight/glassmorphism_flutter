import 'package:flutter/material.dart';
import 'package:glassmorphism_flutter/ui/widgets/hs_glass_card.dart';
import 'package:glassmorphism_flutter/ui/widgets/path_painter.dart';

import 'glass.dart';
import 'glass_container.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody>
    with TickerProviderStateMixin {
  late final AnimationController _heartAnimationController =
      AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animationScale = CurvedAnimation(
    parent: _heartAnimationController,
    curve: Curves.bounceOut,
  );
  late AnimationController _cardAnimationsController;
  late Animation<double> _cardScale1;
  late Animation<double> _cardScale2;
  late Animation<double> _cardScale3;

  @override
  void initState() {
    super.initState();
    _cardAnimationsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _cardScale1 = CurvedAnimation(
      parent: _cardAnimationsController,
      curve: const Interval(0.0, 0.400),
    );
    _cardScale2 = CurvedAnimation(
      parent: _cardAnimationsController,
      curve: const Interval(0.400, 0.800),
    );
    _cardScale3 = CurvedAnimation(
      parent: _cardAnimationsController,
      curve: const Interval(0.800, 0.999),
    );

    _cardAnimationsController.forward();
  }

  @override
  void dispose() {
    _cardAnimationsController.dispose();
    _heartAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                        children: [
                          ScaleTransition(
                            scale: _cardScale1,
                            child: const HomeScreenGlassCard(
                                title: 'Training',
                                definition: 'hours',
                                value: '15:33'),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ScaleTransition(
                            scale: _cardScale2,
                            child: const HomeScreenGlassCard(
                                title: 'Distance',
                                definition: 'Kilometters',
                                value: '12'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: ScaleTransition(
                        scale: _cardScale3,
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
                                    children: [
                                      const Text('BMP: 111'),
                                      ScaleTransition(
                                        scale: _animationScale,
                                        child: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}
