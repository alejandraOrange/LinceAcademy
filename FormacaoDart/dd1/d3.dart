void main() {
  String paragrafo =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
      'Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.';

  // Exibir o parágrafo
  print('parágrafo: $paragrafo');

  // Número de palavras
  List<String> palavras = paragrafo.split(RegExp(r'\s+'));
  print('Numero de palavras: ${palavras.length}');

  // Tamanho do texto
  print('Tamanho do texto: ${paragrafo.length}');

  // Número de frases
  List<String> frases =
      paragrafo
          .split(RegExp(r'[.!?]'))
          .where((f) => f.trim().isNotEmpty)
          .toList();
  print('Numero de frases: ${frases.length}');

  // Contagem de vogais
  int numeroVogais = RegExp(r'[aeiouAEIOU]').allMatches(paragrafo).length;
  print('Numero de vogais: $numeroVogais');

  // Consoantes únicas presentes no texto
  Set<String> consoantesEncontradas = {};
  for (var char in paragrafo.toLowerCase().runes) {
    String letra = String.fromCharCode(char);
    if (RegExp(r'[bcdfghjklmnpqrstvwxyz]').hasMatch(letra)) {
      consoantesEncontradas.add(letra);
    }
  }

  // Ordenar consoantes para saída organizada
  List<String> consoantesOrdenadas = consoantesEncontradas.toList()..sort();

  print('Consoantes encontradas: ${consoantesOrdenadas.join(', ')}');
}
