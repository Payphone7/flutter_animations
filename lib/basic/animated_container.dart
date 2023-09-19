import 'dart:math';

import 'package:flutter/material.dart';



/// ********************
///
///  一个随机修改圆角跟margin的Widget
///  
/// ********************


double generateBorderRadius() => Random().nextDouble() * 64;

double generateMargin() => Random().nextDouble() * 64;

Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));


class AnimatedContainerDemo extends StatefulWidget {
  static String routeName = 'basics/animated_container';

  const AnimatedContainerDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AnimatedContainerDemoState();
  }
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = Colors.deepPurple;
    borderRadius = generateBorderRadius();
    margin = generateMargin();
  }

  void change() {
    setState(() {
      color = generateColor();
      borderRadius = generateBorderRadius();
      margin = generateMargin();
      print(color);
      print(borderRadius);
      print(margin);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('AnimationContainer'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  duration: const Duration(microseconds: 400),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () => change(),
                child: const Text('change')),
          ],
        ),
      ),
    );
  }
}
