void main() {
  String nome = "Alejandra";
  String sobrenome = "Naranjo";
  int idade = 23;
  bool ativo = true;
  double peso = 46.2;
  String? nacionalidade = "Venezolana";

  print("Nome completo: $nome $sobrenome");

  print("Idade: $idade (${idade >= 18 ? 'maior' : 'menor'} de idade)");

  if (ativo == true) {
    print("Situação: Ativo");
  } else {
    print("Situação: Inativo");
  }

  print("Peso: $peso");

  if (nacionalidade != null && nacionalidade.isNotEmpty) {
    print("Nacionalidade: $nacionalidade");
  } else {
    print("Nacionalidade: Não informada");
  }
}
