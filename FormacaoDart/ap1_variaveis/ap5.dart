class Pessoa {
  String nome = "Alejandra";
  String sobrenome = "Naranjo";
  int idade = 23;
  bool ativo = true;
  double peso = 46.2;
  String? nacionalidade = "Venezolana";

  @override
  String toString() {
    print("Nome completo: $nome $sobrenome");
    print("Idade: $idade (${idade >= 18 ? 'maior' : 'menor'} de idade)");

    if (ativo == true) {
      print("Situação: Ativo");
    } else {
      print("Situação: Inativo");
    }

    print("Peso: $peso");

    if (nacionalidade != null && nacionalidade!.isNotEmpty) {
      print("Nacionalidade: $nacionalidade");
    } else {
      print("Nacionalidade: Não informada");
    }

    return ""; // Added return statement
  }
}

void main() {
  // Cria uma instância da classe DadosPessoais.
  Pessoa pessoa1 = Pessoa();
  pessoa1.nome = "Alejandra";
  pessoa1.sobrenome = "Naranjo";
  pessoa1.idade = 23;
  pessoa1.ativo = true;
  pessoa1.peso = 46.2;
  pessoa1.nacionalidade = "venezolana";

  pessoa1.toString();
}
