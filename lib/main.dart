import 'package:custom_painter/dots_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: DotsWidget(
          itemsCount: 5,
          currentPosition: _currentPosition,
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.remove),
            backgroundColor: Colors.amber,
            onPressed: () {
              setState(() {
                if (_currentPosition > 0) {
                  _currentPosition--;
                }
              });
            },
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                if (_currentPosition < 4) {
                  _currentPosition++;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
