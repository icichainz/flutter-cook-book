import 'package:flutter/material.dart';

class DisplaySnackbar extends StatefulWidget {
  const DisplaySnackbar({super.key});

  @override
  State<DisplaySnackbar> createState() => _DisplaySnackbarState();
}

class _DisplaySnackbarState extends State<DisplaySnackbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display a snackbar"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text("Yay ! A SnackBar !"),
              action: SnackBarAction(label: 'Undo', onPressed: () {}),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text("Show snackbar"),
        ),
      ),
    );
  }
}
