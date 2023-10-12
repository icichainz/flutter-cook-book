import 'package:flutter/material.dart';

class AnimateWithOpacity extends StatefulWidget {
  const AnimateWithOpacity({super.key});

  @override
  State<AnimateWithOpacity> createState() => _AnimateWithOpacityState();
}

class _AnimateWithOpacityState extends State<AnimateWithOpacity> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _isVisible ? Colors.red : Colors.green,
        onPressed: () {
          setState(() {
            _isVisible = !_isVisible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: _isVisible
            ? const Icon(
                Icons.flip,
                color: Colors.white,
              )
            : const Icon(
                Icons.flip_to_back,
                color: Colors.white,
              ),
      ),
    );
  }
}
