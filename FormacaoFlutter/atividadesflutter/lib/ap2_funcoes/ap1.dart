import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: ColorBoxes())),
    );
  }
}

class ColorBoxes extends StatelessWidget {
  const ColorBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildBox(Colors.red),
            _buildBox(Colors.green),
            _buildBox(Colors.blue),
          ],
        ),
        //linha de retângulos e coluna
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildBox(Colors.purple, height: 100),
            _buildBox(Colors.cyan, height: 100),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [_buildBox(Colors.purple), _buildBox(Colors.cyan)],
            ),
          ],
        ),
        //quadrado preto centralizado dentro de cinza
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          color: Colors.grey,
          child: _buildBox(Colors.black),
        ),
      ],
    );
  }

  Widget _buildBox(Color color, {double width = 50, double height = 50}) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: width,
      height: height,
      color: color,
    );
  }
}
