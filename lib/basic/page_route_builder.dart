import 'package:flutter/material.dart';

class PageRouteBuilderDemo extends StatelessWidget {
  static const routeName = "basic/page_route_builder";

  const PageRouteBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page1"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Route to Page2'),
          onPressed: () {
            //demo 写法
            // Navigator.of(context).push<void>(_createRoute());
            ///传入目标Widget
            Navigator.of(context).push<void>(_createRouteWidget(_Page2()));
          },
        ),
      ),
    );
  }
}

Route _createRouteWidget(Widget widget) {
  return PageRouteBuilder<SlideTransition>(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      ///从底下出现
      // var tween =
      //     Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero);
      ///从右侧出现
      var tween =
      Tween<Offset>(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0));
      var curveTween = CurveTween(curve: Curves.ease);
      return SlideTransition(
        position: animation.drive(curveTween).drive(tween),
        child: child,
      );
    },
  );
}

Route _createRoute() {
  return PageRouteBuilder<SlideTransition>(
    pageBuilder: (context, animation, secondaryAnimation) => _Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      ///从底下出现
      // var tween =
      //     Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero);
      ///从右侧出现
      var tween =
      Tween<Offset>(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0));
      var curveTween = CurveTween(curve: Curves.ease);
      return SlideTransition(
        position: animation.drive(curveTween).drive(tween),
        child: child,
      );
    },
  );
}

class _Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
      ),
      body: Center(
        child: Text(
          'Page2',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
