void main() {
  List<String> entrada = [
    "10",
    "2XXL7",
    "JOJ0",
    "99",
    "381",
    "AD44",
    "47",
    "2B",
    "123",
    "78",
  ];
  // Mapeia cada item tentando converter para int, caso contrário retorna 0
  List<int> convertida =
      entrada.map((item) {
        return int.tryParse(item) ?? 0;
      }).toList();

  print("Lista convertida: ${convertida.join(', ')}");
}
