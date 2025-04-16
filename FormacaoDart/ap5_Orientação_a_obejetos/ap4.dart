import 'dart:math';

class Pessoa {
  String _nome = '';
  int _idade = 0;
  double _altura = 0.0;

  //setter do nome
  set nome(String nome) => _nome = nome;

  //getter do nome
  String get nome => _nome;

  //setter com validação para idade
  set idade(int novaIdade) {
    if (novaIdade >= 0) {
      _idade = novaIdade;
    }
  }

  //getter da idade
  int get idade => _idade;

  //setter para altura
  set altura(double novaAltura) => _altura = novaAltura;

  //getter altura
  double get altura => _altura;
}

void main() {
  final Random random = Random();

  Pessoa pessoa = Pessoa();

  pessoa.nome = "Alejandra";
  pessoa.idade = random.nextInt(100);
  pessoa.altura = (random.nextDouble() * (2.3 - 1.0) + 1.0);

  print("Nome: ${pessoa.nome}");
  print("Idade: ${pessoa.idade}");
  print("Altura: ${pessoa.altura.toStringAsFixed(2)}");
}
