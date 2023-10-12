import 'package:flutter/material.dart';

class AddDrawerToScreen extends StatefulWidget {
  const AddDrawerToScreen({super.key});

  @override
  State<AddDrawerToScreen> createState() => _AddDrawerToScreenState();
}

class _AddDrawerToScreenState extends State<AddDrawerToScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add drawer to a scaffold"),
      ),
      body: Center(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Drawer Header"),
            ),
            ListTile(
              title: const Text("Home"),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Business"),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("School"),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
