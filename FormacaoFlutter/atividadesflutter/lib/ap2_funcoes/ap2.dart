import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: MyWidget())),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Pilha(
          backgroundColor: Colors.grey,
          children: [Colors.red, Colors.yellow, Colors.blue],
        ),
        Pilha(
          backgroundColor: Colors.black,
          children: [
            Colors.deepPurple,
            Colors.deepOrange,
            Colors.yellow,
            Colors.lime,
          ],
        ),
        Pilha(children: [Colors.red, Colors.yellow, Colors.blue]),
        Pilha(
          backgroundColor: Colors.white,
          children: [
            Colors.deepPurple,
            Colors.deepOrange,
            Colors.yellow,
            Colors.lime,
          ],
        ),
      ],
    );
  }
}

class Pilha extends StatelessWidget {
  const Pilha({this.backgroundColor, required this.children});

  final Color? backgroundColor;
  final List<Color> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 100,
      height: 100,
      color: backgroundColor,
      child: Stack(
        children: [
          for (var index = 0; index < children.length; index++)
            Positioned(
              top: 8.0 + index * 8,
              left: 8.0 + index * 8,
              child: Container(width: 50, height: 50, color: children[index]),
            ),
        ],
      ),
    );
  }
}
