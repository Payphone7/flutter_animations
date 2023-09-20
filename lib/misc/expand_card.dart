// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ExpandCardDemo extends StatelessWidget {
  const ExpandCardDemo({super.key});

  static const String routeName = 'misc/expand_card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expandable Card"),
      ),
      body: Center(
        child: ExpandCard(),
      ),
    );
  }
}

class ExpandCard extends StatefulWidget {
  const ExpandCard({super.key});


  @override
  State<StatefulWidget> createState() {
    return _ExpandCardState();
  }

}

class _ExpandCardState extends State<ExpandCard> {

  static const Duration duration = Duration(milliseconds: 300);

  bool select = false;

  double get size => select ? 256 : 128;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleExpand(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: duration,
            width: size,
            height: size,
            curve: Curves.ease,
            child: AnimatedCrossFade(
              duration: duration,
              firstCurve: Curves.easeInOutSine,
              secondCurve: Curves.easeInOutSine,
              crossFadeState: select
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              layoutBuilder: (topChild, topChildKey, bottomChild,
                  bottomChildKey) {
                return Stack(
                  children: [
                    Positioned.fill(key: bottomChildKey,child: bottomChild,),
                    Positioned.fill(key: topChildKey,child: topChild,)
                  ],
                );
              },
              firstChild: Image.asset(
                'assets/eat_cape_town_sm.jpg',
                fit: BoxFit.cover,
              ),
              secondChild: Image.asset(
                'assets/eat_new_orleans_sm.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void toggleExpand() {
    setState(() {
      select = !select;
    });
  }
}
