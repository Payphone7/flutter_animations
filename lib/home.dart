import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'const.dart';
import 'models/demo.dart';





class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations Sample"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Basics", style: headerStyle),
          ),
          ...basicDemos.map((e) => DemoTile(demo: e)),
          ListTile(
            title: Text("Misc", style: headerStyle),
          ),
          ...miscDemos.map((e) => DemoTile(demo: e)),
        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  const DemoTile({super.key, required this.demo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        context.go('/${demo.route}');
      },
    );
  }
}