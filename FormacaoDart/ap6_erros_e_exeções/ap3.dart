import 'dart:math';

abstract class Forma {
  double calcularArea();
}

class Retangulo implements Forma {
  final double _base;
  final double _altura;

  Retangulo(this._base, this._altura) {
    if (_base <= 0 || _altura <= 0) {
      throw Exception(
        'Dimensões invalidas, informe apenas valores positivos maiores que zero',
      );
    }
  }

  @override
  double calcularArea() => _base * _altura;
}

void main() {
  final random = Random();
  double base = random.nextDouble() * 99;
  double altura = random.nextDouble() * 99;

  try {
    final retangulo = Retangulo(base, altura);
    double area = retangulo.calcularArea();
    print('Area do retangulo: ${area.toStringAsFixed(2)}');
  } catch (e) {
    print(e);
  }
}
