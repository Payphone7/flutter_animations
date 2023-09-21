import 'package:flutter/material.dart';

class FocusImageDemo extends StatelessWidget {
  static String routeName = 'misc/focus_image';

  const FocusImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Focus Image"),
      ),
      body: Grid(),
    );
  }
}

class Grid extends StatelessWidget {
  const Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 3000,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ((index-2) % 5 == 0)
                ? const SmallCard(
                    imageAssetName: 'assets/eat_cape_town_sm.jpg',
                  )
                : const SmallCard(
                    imageAssetName: 'assets/eat_new_orleans_sm.jpg',
                  );
          }),
    );
  }
}

class SmallCard extends StatelessWidget {
  final String imageAssetName;

  const SmallCard({required this.imageAssetName, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: InkWell(
          onTap: () {
            var nav = Navigator.of(context);
            nav.push<void>(_createRoute(context, imageAssetName));
          },
          child: Image.asset(
            imageAssetName,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

Route _createRoute(BuildContext parentContext, String image) {
  return PageRouteBuilder<void>(
      pageBuilder: (context, animation, secondaryAnimation) {
    return _SecondPage(image);
  }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
    var rectAnimation = _createTween(parentContext)
        .chain(CurveTween(curve: Curves.ease))
        .animate(animation);
    return Stack(
      children: [PositionedTransition(rect: rectAnimation, child: child)],
    );
  });
}

Tween<RelativeRect> _createTween(BuildContext context) {
  var windowSize = MediaQuery.of(context).size;
  var box = context.findRenderObject() as RenderBox;
  var rect = box.localToGlobal(Offset.zero) & box.size;
  var relativeRect = RelativeRect.fromSize(rect, windowSize);

  return RelativeRectTween(
    begin: relativeRect,
    end: RelativeRect.fill,
  );
}

class _SecondPage extends StatelessWidget {
  final String imageAssetName;

  const _SecondPage(this.imageAssetName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                imageAssetName,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
