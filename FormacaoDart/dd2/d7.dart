import 'dart:collection';
import 'dart:math';

// Classe para representar uma pessoa
class Pessoa {
  final String nome;
  final String sobrenome;

  Pessoa(this.nome, this.sobrenome);

  @override
  String toString() => '$nome $sobrenome';
}

// Classe geradora de nomes aleatórios
class GeradorNomes {
  static final List<String> nomes = [
    'Ana',
    'Bruno',
    'Carlos',
    'Daniela',
    'Eduardo',
    'Fernanda',
    'Gustavo',
    'Helena',
    'Igor',
    'Juliana',
  ];
  static final List<String> sobrenomes = [
    'Silva',
    'Souza',
    'Oliveira',
    'Costa',
    'Martins',
    'Almeida',
    'Ferreira',
    'Lima',
    'Rocha',
    'Gomes',
  ];

  static final Random _random = Random();

  static Pessoa gerarNomeAleatorio() {
    String nome = nomes[_random.nextInt(nomes.length)];
    String sobrenome = sobrenomes[_random.nextInt(sobrenomes.length)];
    return Pessoa(nome, sobrenome);
  }
}

// Classe que controla a fila
class FilaMercado {
  final Queue<Pessoa> _fila = Queue<Pessoa>();

  void entrarNaFila(Pessoa pessoa) {
    _fila.addLast(pessoa);
    print('(${pessoa}) entrou na fila');
  }

  void atenderPessoa() {
    if (_fila.isNotEmpty) {
      Pessoa atendido = _fila.removeFirst();
      print('(${atendido}) foi atendido(a)');
    } else {
      print('A fila está vazia.');
    }
  }

  bool get estaVazia => _fila.isEmpty;
}

void main() {
  final fila = FilaMercado();

  // Adiciona 10 pessoas à fila
  for (int i = 0; i < 10; i++) {
    Pessoa pessoa = GeradorNomes.gerarNomeAleatorio();
    fila.entrarNaFila(pessoa);
  }

  print('\n--- Iniciando atendimento ---\n');

  // Atende todas as pessoas da fila
  while (!fila.estaVazia) {
    fila.atenderPessoa();
  }

  print('\n--- Fila finalizada ---');
}
