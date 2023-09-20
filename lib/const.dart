import 'package:flutter/animation.dart';
import 'package:flutter_animations/basic/animation_controller.dart';
import 'package:go_router/go_router.dart';

import 'basic/animated_container.dart';
import 'basic/page_route_builder.dart';
import 'home.dart';
import 'misc/expand_card.dart';
import 'models/demo.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const HomePage(),
    routes: [
      for (final demo in basicDemos)
        GoRoute(
            path: demo.route,
            builder: (context, state) => demo.builder(context)),
      for (final demo in miscDemos)
        GoRoute(
          path: demo.route,
          builder: (context, state) => demo.builder(context),
        ),
    ],
  )
]);

final basicDemos = [
  Demo(
    name: 'AnimatedContainer',
    route: AnimatedContainerDemo.routeName,
    builder: (context) => const AnimatedContainerDemo(),
  ),
  Demo(
    name: 'PageRouteBuilder',
    route: PageRouteBuilderDemo.routeName,
    builder: (context) => const PageRouteBuilderDemo(),
  ),
  Demo(
    name: 'Animation Controller',
    route: AnimationControllerDemo.routeName,
    builder: (context) => const AnimationControllerDemo(),
  ),
];

final miscDemos = [
  Demo(
    name: 'Expandable Card',
    route: ExpandCardDemo.routeName,
    builder: (context) => const ExpandCardDemo(),
  ),
];
