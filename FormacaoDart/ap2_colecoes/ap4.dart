void main() {
  Map<String, List<String>> cidadesPorEstado = {
    'SC': ['Blumenau', 'Florianópolis', 'Gaspar'],
    'MG': ['Belo Horizonte', 'Uberlândia', 'Contagem'],
    'SP': ['São Paulo', 'Campinas', 'Guarulhos'],
    'RJ': ['Rio de Janeiro', 'Niterói', 'São Gonçalo'],
  };

  // Imprime as siglas dos estados
  String estados = cidadesPorEstado.keys.join(' ; ');
  print('Estados: $estados');

  // Imprime as cidades de SC em ordem alfabética
  List<String> cidadesSC = List.from(cidadesPorEstado['SC'] ?? []);
  String cidadesSCFormatadas = cidadesSC.join(' ; ');
  print('Cidades de SC: $cidadesSCFormatadas');

  List<String> todasCidades = [];

  cidadesPorEstado.forEach((estado, cidades) {
    cidades.forEach((cidade) {
      todasCidades.add('$cidade - $estado');
    });
  });
  todasCidades.sort();
  todasCidades.forEach(print);
}
