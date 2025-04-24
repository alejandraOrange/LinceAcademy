import 'dart:math';

void main() {
  final pessoa = Pessoa();

  // Consumindo produtos fornecidos de diferentes fornecedores
  for (var i = 0; i < 5; i++) {
    final fornecedor = escolherFornecedorAleatorio();
    pessoa.refeicao(fornecedor);
  }

  pessoa.informacoes();
}

// Enum para representar o status de calorias da pessoa
enum StatusCalorias { deficitExtremo, deficit, satisfeita, excesso }

// Classe base para todos os fornecedores
abstract class Fornecedor {
  final Random _random = Random();
  final List<Produto> _produtosDisponiveis;

  Fornecedor(this._produtosDisponiveis);

  Produto fornecer() {
    return _produtosDisponiveis[_random.nextInt(_produtosDisponiveis.length)];
  }
}

// Implementação dos novos fornecedores
class FornecedorDeBebidas extends Fornecedor {
  FornecedorDeBebidas()
    : super([
        Produto('Água', 0),
        Produto('Refrigerante', 200),
        Produto('Suco de fruta', 100),
        Produto('Energético', 135),
        Produto('Café', 60),
        Produto('Chá', 35),
      ]);
}

class FornecedorDeSanduiches extends Fornecedor {
  FornecedorDeSanduiches()
    : super([
        Produto('Sanduíche natural', 350),
        Produto('Hambúrguer', 500),
        Produto('Wrap de frango', 400),
        Produto('Sanduíche de atum', 380),
        Produto('Bauru', 450),
      ]);
}

class FornecedorDeBolos extends Fornecedor {
  FornecedorDeBolos()
    : super([
        Produto('Bolo de chocolate', 450),
        Produto('Bolo de cenoura', 380),
        Produto('Bolo de laranja', 350),
        Produto('Cheesecake', 500),
        Produto('Red velvet', 480),
      ]);
}

class FornecedorDeSaladas extends Fornecedor {
  FornecedorDeSaladas()
    : super([
        Produto('Salada Caesar', 300),
        Produto('Salada Grega', 250),
        Produto('Salada de frutas', 200),
        Produto('Salada Caprese', 280),
        Produto('Salada Tropical', 220),
      ]);
}

class FornecedorDePetiscos extends Fornecedor {
  FornecedorDePetiscos()
    : super([
        Produto('Batata frita', 400),
        Produto('Nachos', 350),
        Produto('Bolinho de queijo', 300),
        Produto('Coxinha', 280),
        Produto('Pastel', 320),
      ]);
}

class FornecedorUltraCalorico extends Fornecedor {
  FornecedorUltraCalorico()
    : super([
        Produto('Pizza', 1200),
        Produto('Lasanha', 900),
        Produto('Feijoada', 850),
        Produto('Churrasco', 1000),
        Produto('Macarrão carbonara', 950),
      ]);
}

// Função para escolher fornecedor aleatório
Fornecedor escolherFornecedorAleatorio() {
  final fornecedores = <Fornecedor>[
    FornecedorDeBebidas(),
    FornecedorDeSanduiches(),
    FornecedorDeBolos(),
    FornecedorDeSaladas(),
    FornecedorDePetiscos(),
    FornecedorUltraCalorico(),
  ];

  return fornecedores[Random().nextInt(fornecedores.length)];
}

class Produto {
  Produto(this.nome, this.calorias);

  final String nome;
  final int calorias;
}

class Pessoa {
  int _caloriasConsumidas;
  int _refeicoesRealizadas = 0;

  Pessoa() : _caloriasConsumidas = Random().nextInt(3000) {
    print('Pessoa criada com nível inicial de ${_caloriasConsumidas} calorias');
  }

  StatusCalorias get status {
    if (_caloriasConsumidas <= 500) return StatusCalorias.deficitExtremo;
    if (_caloriasConsumidas <= 1800) return StatusCalorias.deficit;
    if (_caloriasConsumidas <= 2500) return StatusCalorias.satisfeita;
    return StatusCalorias.excesso;
  }

  bool get precisaDeRefeicao {
    return status == StatusCalorias.deficitExtremo ||
        status == StatusCalorias.deficit;
  }

  void informacoes() {
    final statusDescricao =
        {
          StatusCalorias.deficitExtremo: 'Déficit extremo de calorias',
          StatusCalorias.deficit: 'Déficit de calorias',
          StatusCalorias.satisfeita: 'Pessoa está satisfeita',
          StatusCalorias.excesso: 'Excesso de calorias',
        }[status];

    print('\nInformações da pessoa:');
    print('Calorias consumidas: $_caloriasConsumidas');
    print('Status: $statusDescricao');
    print('Refeições realizadas: $_refeicoesRealizadas');
    print('Precisa de refeições? ${precisaDeRefeicao ? "Sim" : "Não"}');
  }

  void refeicao(Fornecedor fornecedor) {
    if (!precisaDeRefeicao) {
      print('Pessoa não precisa de mais refeições no momento');
      return;
    }

    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    _caloriasConsumidas += produto.calorias;
    _refeicoesRealizadas++;
  }
}
