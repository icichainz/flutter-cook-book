import 'package:flutter/material.dart';
import 'package:flutter_coockbook/animation/animate_container_property.dart';
import 'package:flutter_coockbook/animation/animate_page_physic_simulation.dart';
import 'package:flutter_coockbook/animation/animate_page_route_transition.dart';
import 'package:flutter_coockbook/animation/animate_with_opacity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CookBook',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter CoockBook'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            /// Simple route animation
            ListTile(
              title: const Text("Page route animation"),
              tileColor: Colors.grey.shade200,
              subtitle: const Text(
                  "Démonstrate how to use page route navigation with flutter"),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Page1())),
            ),

            /// Physic based animation
            ListTile(
              title: const Text("Physic based animation"),
              tileColor: Colors.yellow,
              subtitle: const Text(
                  "Demonstrate how to make physic animation with flutter"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PhysicsCardDragDemo())),
            ),

            /// Animate a containe property
            ListTile(
              title: const Text("Animate a controller property"),
              tileColor: Colors.brown,
              subtitle:
                  const Text("Demonstrate how to animate a container property"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const AnimatedContainerApp())),
            ),

            /// Animated opacity
            ListTile(
              title: const Text("Animate a widget opacity"),
              tileColor: Colors.red,
              subtitle: const Text("Demonstrate how to animate opacity"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const AnimateWithOpacity())),
            )
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
