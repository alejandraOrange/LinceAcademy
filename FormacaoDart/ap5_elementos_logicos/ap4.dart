int contarNome(List<String> nomes, String nomeBuscado) {
  return nomes.where((nome) => nome == nomeBuscado).length;
}

void main() {
  final listaNomes = [
    "Derdlim",
    "Igor",
    "Luis",
    "Pedro",
    "Maria",
    "Ana",
    "Derdlim",
    "Petra",
    "Luis",
    "Pedro",
    "Fernanda",
    "Ana",
  ];

  final nome = 'Ana';
  final quantidade = contarNome(listaNomes, nome);

  if (quantidade == 1) {
    print('O nome $nome foi encontrado 1 vez');
  } else if (quantidade > 0) {
    print('O nome $nome foi encontrado $quantidade vezes');
  } else {
    print('O nome não foi encontrado');
  }
}
