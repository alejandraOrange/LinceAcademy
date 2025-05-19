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
      initialRoute: '/',
      routes: {
        '/': (context) => const RotaInicial(),
        '/cor': (context) {
          final cor = ModalRoute.of(context)!.settings.arguments as Color;
          return RotaCor(cor: cor);
        },
      },
    );
  }
}

class ItensDaLista {
  const ItensDaLista(this.cor, this.texto);

  final Color cor;
  final String texto;
}

class RotaInicial extends StatelessWidget {
  const RotaInicial({super.key});

  final core = const [
    ItensDaLista(Colors.red, 'Vermelho'),
    ItensDaLista(Colors.green, 'Verde'),
    ItensDaLista(Colors.blue, 'Azul'),
    ItensDaLista(Colors.purple, 'Roxo'),
    ItensDaLista(Colors.orange, 'Laranja'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cor selecionada")),
      body: ListView.builder(
        itemCount: core.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Center(child: CorItem(core[index].texto, core[index].cor)),
          );
        },
      ),
    );
  }
}

class RotaCor extends StatelessWidget {
  const RotaCor({super.key, required this.cor});

  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cor selecionada"),
        backgroundColor: cor,
      ),
      body: Container(
        color: cor,
        child: const Center(
          child: Text(
            'Esta é a cor selecionada!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CorItem extends StatelessWidget {
  const CorItem(this.texto, this.cor, {super.key});

  final Color cor;
  final String texto;

  bool _useWhiteText(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: cor,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/cor', arguments: cor);
        },
        child: SizedBox(
          height: 56,
          child: Center(
            child: Text(
              texto,
              style: TextStyle(
                color: _useWhiteText(cor) ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
