//calcula o valor e porcentagem
int calcularDesconto(double valorOrig, double valordesconto) {
  double desconto = valorOrig - valordesconto;

  double porcentagem = (desconto / valorOrig) * 100;

  return porcentagem.toInt();
}

void main() {
  double valorOrig = 10.0;
  double valorDesconto = 7.0;

  int desconto = calcularDesconto(valorOrig, valorDesconto);

  print(
    "O produto custava $valorOrig reais, foi vendido por $valorDesconto reais. O desconto foi de $desconto%",
  );
}
