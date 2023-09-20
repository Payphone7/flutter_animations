import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationControllerDemo extends StatefulWidget {
  const AnimationControllerDemo({super.key});

  static const String routeName = 'basics/animation_controller';

  @override
  State<StatefulWidget> createState() {
    return _AnimationControllerDemoState();
  }
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo>
    with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(seconds: 1);
  late final AnimationController controller;

  int count = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _duration)
      ..addListener(() {
        //10秒  0 - 1201次
        //5秒  0 - 602次
        //3秒  0 - 361次
        //2秒  0 - 243次
        //1秒  0 - 123次
        /// 大概 1秒 120上下
        print(count++);
        setState(() {
          // 保留小数点后3位
          // print(controller.value.toStringAsFixed(3));
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Controller"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Text(
                controller.value.toStringAsFixed(2),
                style: Theme.of(context).textTheme.displaySmall,
                textScaleFactor: 1 + controller.value,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  switch (controller.status) {
                    case AnimationStatus.completed:
                      controller.reverse();
                    default:
                      controller.forward();
                  }
                },
                child: const Text('animate'))
          ],
        ),
      ),
    );
  }
}
