import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenDemo extends StatefulWidget {
  static const String routeName = 'basics/tweens';

  const TweenDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TweenDemoState();
  }
}

class _TweenDemoState extends State<TweenDemo>
    with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(seconds: 4);
  static const double accountBalance = 1000000;
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this, duration: _duration)
      ..addListener(() {
        setState(() {});
      });
    animation = Tween(begin: 0.0, end: accountBalance).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teens"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Text(
                '\$${animation.value.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  switch(controller.status){
                    case AnimationStatus.completed:
                      controller.reverse();
                    default:
                      controller.forward();
                  }
                },
                child: Text(
                  switch (controller.status) {
                    AnimationStatus.completed => 'Buy a Mansion',
                    AnimationStatus.forward => 'Accruing...',
                    AnimationStatus.reverse => 'Spending...',
                    _ => 'Win the lottery',
                  },
                ),)
          ],
        ),
      ),
    );
  }
}
