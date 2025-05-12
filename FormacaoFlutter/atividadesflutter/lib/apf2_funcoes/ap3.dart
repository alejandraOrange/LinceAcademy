import 'package:flutter/material.dart';
import 'dart:math';

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
      home: Scaffold(body: MyWidget()),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final random = Random();

  bool quadrado = true;
  Color cor = Colors.red;

  final List<Color> cores = [
    Colors.red,
    Colors.purple,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];

  String get textoBotao =>
      quadrado ? 'Mudar para círculo' : 'Mudar para quadrado';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // centraliza verticalmente
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    quadrado = !quadrado;
                  });
                },
                child: Text(textoBotao),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  cor = cores[random.nextInt(cores.length)];
                });
              },
              child: const Text('Cor aleatória'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: cor,
                shape: quadrado ? BoxShape.rectangle : BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
