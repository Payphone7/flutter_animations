import 'package:flutter/animation.dart';
import 'package:flutter_animations/basic/animation_controller.dart';
import 'package:flutter_animations/basic/custom_tween.dart';
import 'package:flutter_animations/basic/tweens.dart';
import 'package:flutter_animations/misc/carousel.dart';
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
  Demo(
    name: 'Tweens',
    route: TweenDemo.routeName,
    builder: (context) => const TweenDemo(),
  ),
  Demo(
    name: 'Custom Tween',
    route: CustomTweenDemo.routeName,
    builder: (context) => const CustomTweenDemo(),
  ),

];

final miscDemos = [
  Demo(
    name: 'Expandable Card',
    route: ExpandCardDemo.routeName,
    builder: (context) => const ExpandCardDemo(),
  ),
  Demo(
    name: 'Carousel',
    route: CarouselDemo.routeName,
    builder: (context) =>  CarouselDemo(),
  ),
];
