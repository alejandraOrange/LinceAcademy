void main() {
  // Declara e inicializa uma variável String chamada 'nome' com o valor "Alejandra".
  String nome = "Alejandra";

  // Declara e inicializa uma variável String chamada 'sobrenome' com o valor "Naranjo".
  String sobrenome = "Naranjo";

  // Declara e inicializa uma variável inteira chamada 'idade' com o valor 23.
  int idade = 23;

  // Declara e inicializa uma variável booleana chamada 'ativo' com o valor true.
  bool ativo = true;

  // Declara e inicializa uma variável double chamada 'peso' com o valor 46.2.
  double peso = 46.2;

  // Declara e inicializa uma variável String opcional chamada 'nacionalidade' com o valor "Venezolana".
  // O '?' indica que a variável pode ser nula.
  String? nacionalidade = "Venezolana";

  // Imprime o nome completo concatenando 'nome' e 'sobrenome'.
  print("Nome completo: $nome $sobrenome");

  // Imprime a idade e verifica se é maior ou menor de idade usando um operador ternário.
  print("Idade: $idade (${idade >= 18 ? 'maior' : 'menor'} de idade)");

  // Verifica se a variável 'ativo' é verdadeira e imprime a situação correspondente.
  if (ativo == true) {
    print("Situação: Ativo");
  } else {
    print("Situação: Inativo");
  }

  // Imprime o peso.
  print("Peso: $peso");

  // Verifica se 'nacionalidade' não é nula e não está vazia, e imprime a nacionalidade ou "Não informada".
  if (nacionalidade != null && nacionalidade.isNotEmpty) {
    print("Nacionalidade: $nacionalidade");
  } else {
    print("Nacionalidade: Não informada");
  }
}
