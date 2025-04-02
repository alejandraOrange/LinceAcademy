void main() {
  const List<double> valores = [7.0, 8.0, 5.3, 9.7];
  final double media = calcularMedia(valores); // Nome da função mais descritivo
  print(
    "A média entre $valores = ${media.toStringAsFixed(2)}",
  ); // Formatação da média
}

double calcularMedia(List<double> valores) {
  if (valores.isEmpty) {
    // Lida com listas vazias
    return 0.0; // Retorna 0 para listas vazias (ou você pode lançar uma exceção)
  }

  final double soma = valores.reduce((a, b) => a + b);
  return soma / valores.length;
}
