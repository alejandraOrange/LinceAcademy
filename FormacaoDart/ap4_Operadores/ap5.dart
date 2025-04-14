void main() {
  Map<String, int?> pessoas = {
    'Alejandra': null,
    'Igor': null,
    'Elizabeth': 66,
    'Agnys': 25,
    'Isabella': 19,
    'Luis': 32,
  };

  pessoas.forEach((nome, idade) {
    String mensagem =
        (idade == null) ? "$nome - não prencheu a idade." : "$nome - $idade";

    print(mensagem);
  });
}
