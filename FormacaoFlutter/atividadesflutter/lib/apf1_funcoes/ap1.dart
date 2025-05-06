import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: Center(child: MyWidget())),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Color color = Colors.red;
  final random = Random();

  final List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.blueGrey,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.cyan,
  ];

  final List<String> colorNames = [
    'vermelho',
    'verde',
    'azul',
    'roxo'
        'laranja',
    'cinza azulado',
    'roxo intenso',
    'ciano',
  ];

  void changeColor() {
    int index = random.nextInt(colorList.length);
    setState(() {
      color = colorList[index];
      print('Alterar cor para ${colorNames[index]}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'cor aleatoria',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: changeColor,
          child: const Text('Sortear cor'),
        ),
      ],
    );
  }
}
