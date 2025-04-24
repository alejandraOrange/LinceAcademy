import 'dart:math' as math;

void main() {
  final comparador = ComparadorFormasGeometricas();

  // Formas geométricas existentes
  final circuloA = Circulo('Circulo A', 3);
  final circuloB = Circulo('Circulo B', 8);
  final retanguloA = Retangulo('Retângulo A', 4, 3);
  final retanguloB = Retangulo('Retângulo B', 19, 11);
  final quadrado = Quadrado('Quadrado', 5);

  // Novas formas geométricas
  final trianguloEquilatero = TrianguloEquilatero('Triângulo Equilátero', 6);
  final trianguloRetangulo = TrianguloRetangulo('Triângulo Retângulo', 3, 4);
  final pentagono = PentagonoRegular('Pentágono Regular', 4);
  final hexagono = HexagonoRegular('Hexágono Regular', 5);

  // Lista com todas as formas
  final formas = [
    circuloA,
    circuloB,
    retanguloA,
    retanguloB,
    quadrado,
    trianguloEquilatero,
    trianguloRetangulo,
    pentagono,
    hexagono,
  ];

  // Encontrando a forma com maior área
  final formaMaiorArea = comparador.maiorArea(formas);
  print(
    'A maior área é ${formaMaiorArea.area.toStringAsFixed(2)} '
    'e pertence a ${formaMaiorArea.nome}',
  );

  // Encontrando a forma com maior perímetro
  final formaMaiorPerimetro = comparador.maiorPerimetro(formas);
  print(
    'O maior perímetro é ${formaMaiorPerimetro.perimetro.toStringAsFixed(2)} '
    'e pertence a ${formaMaiorPerimetro.nome}',
  );
}

// Classe abstrata base para todas as formas geométricas
abstract class FormaGeometrica {
  FormaGeometrica(this.nome);

  final String nome;

  double get area;
  double get perimetro;

  @override
  String toString() =>
      '$nome (Área: ${area.toStringAsFixed(2)}, Perímetro: ${perimetro.toStringAsFixed(2)})';
}

// Implementação das formas geométricas
class Circulo extends FormaGeometrica {
  Circulo(String nome, this.raio) : super(nome);

  final double raio;

  @override
  double get area => math.pi * math.pow(raio, 2);

  @override
  double get perimetro => 2 * math.pi * raio;
}

class Retangulo extends FormaGeometrica {
  Retangulo(String nome, this.altura, this.largura) : super(nome);

  final double altura;
  final double largura;

  @override
  double get area => altura * largura;

  @override
  double get perimetro => 2 * (altura + largura);
}

class Quadrado extends FormaGeometrica {
  Quadrado(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double get area => lado * lado;

  @override
  double get perimetro => 4 * lado;
}

class TrianguloEquilatero extends FormaGeometrica {
  TrianguloEquilatero(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double get area => (math.sqrt(3) / 4) * math.pow(lado, 2);

  @override
  double get perimetro => 3 * lado;
}

class TrianguloRetangulo extends FormaGeometrica {
  TrianguloRetangulo(String nome, this.cateto1, this.cateto2) : super(nome);

  final double cateto1;
  final double cateto2;

  double get hipotenusa =>
      math.sqrt(math.pow(cateto1, 2) + math.pow(cateto2, 2));

  @override
  double get area => (cateto1 * cateto2) / 2;

  @override
  double get perimetro => cateto1 + cateto2 + hipotenusa;
}

class PentagonoRegular extends FormaGeometrica {
  PentagonoRegular(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double get area => (5 * math.pow(lado, 2)) / (4 * math.tan(math.pi / 5));

  @override
  double get perimetro => 5 * lado;
}

class HexagonoRegular extends FormaGeometrica {
  HexagonoRegular(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double get area => (3 * math.sqrt(3) * math.pow(lado, 2)) / 2;

  @override
  double get perimetro => 6 * lado;
}

class ComparadorFormasGeometricas {
  // Método para encontrar a forma com maior área
  FormaGeometrica maiorArea(List<FormaGeometrica> formas) {
    if (formas.isEmpty)
      throw ArgumentError('A lista de formas não pode estar vazia');

    FormaGeometrica maior = formas.first;
    for (final forma in formas) {
      if (forma.area > maior.area) {
        maior = forma;
      }
    }
    return maior;
  }

  // Método para encontrar a forma com maior perímetro
  FormaGeometrica maiorPerimetro(List<FormaGeometrica> formas) {
    if (formas.isEmpty)
      throw ArgumentError('A lista de formas não pode estar vazia');

    FormaGeometrica maior = formas.first;
    for (final forma in formas) {
      if (forma.perimetro > maior.perimetro) {
        maior = forma;
      }
    }
    return maior;
  }
}
