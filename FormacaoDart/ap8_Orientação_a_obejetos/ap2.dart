class Retangulo {
  double largura;
  double altura;

  Retangulo(this.largura, this.altura);

  double calcularArea() {
    return altura * largura;
  }
}

void main() {
  Retangulo retangulo = Retangulo(3.0, 5.0);

  double area = retangulo.calcularArea();
  print("Área do retângulo: $area");
}
