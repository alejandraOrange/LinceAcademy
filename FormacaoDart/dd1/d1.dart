import 'dart:math';

void main() {
  List<double> raios = [5, 8, 12, 7.3, 18, 2, 25];

  for (var raio in raios) {
    double area = pi * pow(raio, 2);
    double perimetro = 2 * pi * raio;

    print(
      'Raio: $raio, area: ${area.toStringAsFixed(2)}, perímetro: ${perimetro.toStringAsFixed(2)}.',
    );
  }
}
