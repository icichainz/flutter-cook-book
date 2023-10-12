import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page 1"),),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
              child: const Text('Go'))),
    );
  }

  _createRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          /// Create a tween  and add slide transition widget with curve that controls it.
          const begin = Offset(0.0, 1.0) ;
          const end = Offset.zero;
          const curve = Curves.ease ;
          final tween = Tween(begin: begin,end: end);
          final curveAnimation = CurvedAnimation(parent: animation, curve: curve) ;
          
          
          return SlideTransition(position: tween.animate(curveAnimation),child: child,);
        });
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const  Text("Page 2"),),body: const Center(child: Text('Page 2')),);
  }
}
