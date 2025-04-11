import 'dart:math';

// Função para calcular a área
double calcularArea(double raio) {
  return pi * raio * raio;
}

// Função para calcular o perímetro
double calcularPerimetro(double raio) {
  return 2 * pi * raio;
}

void main() {
  // Inicializa uma lista com 10 raios aleatórios entre 1 e 100
  List<double> raios = List.generate(10, (_) => Random().nextDouble() * 100);

  // Calcula e imprime a área e o perímetro de cada círculo
  for (double raio in raios) {
    double area = calcularArea(raio);
    double perimetro = calcularPerimetro(raio);

    print(
      'Raio: ${raio.toStringAsFixed(2)}, Área: ${area.toStringAsFixed(2)}, Perímetro: ${perimetro.toStringAsFixed(2)}',
    );
  }
}
