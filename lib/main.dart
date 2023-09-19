import 'package:flutter/material.dart';
import 'const.dart';

void main() {
  runApp(const AnimationSamples());
}

class AnimationSamples extends StatelessWidget {
  const AnimationSamples({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Animation Sample",
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}


