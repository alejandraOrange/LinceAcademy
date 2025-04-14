void main() {
  List<String> entrada = ["5O0", "8", "JOJ0", "11"];
  // Mapeia cada item tentando converter para int, caso contrário retorna 0
  List<int> convertida =
      entrada.map((item) {
        return int.tryParse(item) ?? 0;
      }).toList();

  print("Lista convertida: ${convertida.join(', ')}");
}
