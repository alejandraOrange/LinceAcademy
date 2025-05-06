import 'package:atividadesflutter/apf1_funcoes/ap1.dart';
import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 42);

void main() {
  runApp(const MyApp());
}

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
  State<MyWidget> createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  final random = Random();

  int botaoCorreto = 0;
  int clicks = 0;
  bool ganhou = false;
  bool perdeu = false;

  @override
  void initState() {
    super.initState();
    botaoCorreto = random.nextInt(3);
  }

  void tentativa(int opcao) {
    setState(() {
      if (opcao == botaoCorreto) {
        ganhou = true;
      } else {
        clicks++;
      }

      if (clicks >= 2 && !ganhou) {
        perdeu = true;
      }
    });
  }

  void resetarJogo() {
    setState(() {
      botaoCorreto = random.nextInt(3);
      clicks = 0;
      ganhou = false;
      perdeu = false;
    });
  }

  Widget buildMensagem(String texto, Color cor) {
    return Container(
      color: cor,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            texto,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetarJogo,
            child: const Text('Jogar novamente'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (ganhou) return buildMensagem('Você ganhou!', Colors.green);
    if (perdeu) return buildMensagem('Voce perdeu! :(', Colors.red);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Escolha a opção correta',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBotao('A', 0),
            const SizedBox(width: 20),
            _buildBotao('B', 1),
            const SizedBox(width: 20),
            _buildBotao('C', 2),
          ],
        ),
      ],
    );
  }

  Widget _buildBotao(String label, int index) {
    return ElevatedButton(
      onPressed: () => tentativa(index),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      child: Text(label, style: const TextStyle(fontSize: 18)),
    );
  }
}
