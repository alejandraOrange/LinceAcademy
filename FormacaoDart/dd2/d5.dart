import 'dart:math';

class ListaCompras {
  final List<Item> _itensDesejados = [];
  final List<Item> _itensComprados = [];
  final List<Item> _itensSemEstoque = [];

  // Incluir novos itens desejados
  void incluirItem(String nome, int quantidade) {
    _itensDesejados.add(Item(nome, quantidade));
  }

  // Separar os itens já comprados
  void marcarComoComprado(String nome) {
    final item = _buscarItem(nome, _itensDesejados);
    _itensDesejados.remove(item);
    _itensComprados.add(item);
  }

  // Separar os itens sem estoque
  void marcarSemEstoque(String nome) {
    final item = _buscarItem(nome, _itensDesejados);
    _itensDesejados.remove(item);
    _itensSemEstoque.add(item);
  }

  // Exibir itens desejados com quantidades
  void exibirItensDesejados() {
    print('\nItens desejados:');
    for (final item in _itensDesejados) {
      print('${item.nome} - ${item.quantidade}');
    }
  }

  // Escolher um item pendente aleatoriamente
  Item? escolherItemAleatorio() {
    if (_itensDesejados.isEmpty) return null;
    final random = Random();
    return _itensDesejados[random.nextInt(_itensDesejados.length)];
  }

  // Mostrar indicador de progresso
  void mostrarProgresso() {
    final total =
        _itensDesejados.length +
        _itensComprados.length +
        _itensSemEstoque.length;
    final comprados = _itensComprados.length;
    print('\nProgresso: $comprados/$total');
  }

  // Método auxiliar para buscar item
  Item _buscarItem(String nome, List<Item> lista) {
    return lista.firstWhere(
      (item) => item.nome == nome,
      orElse: () => throw Exception('Item não encontrado'),
    );
  }
}

class Item {
  Item(this.nome, this.quantidade);

  final String nome;
  final int quantidade;
}

void main() {
  final lista = ListaCompras();

  // Adicionando itens à lista
  lista.incluirItem('Arroz', 1);
  lista.incluirItem('Feijão', 2);
  lista.incluirItem('Leite', 3);
  lista.incluirItem('Pão', 5);
  lista.incluirItem('Carne', 1);

  // Exibindo itens desejados
  lista.exibirItensDesejados();

  // Simulando compras
  lista.marcarComoComprado('Arroz');
  lista.marcarComoComprado('Leite');
  lista.marcarSemEstoque('Carne');

  // Exibindo progresso
  lista.mostrarProgresso();

  // Escolhendo item aleatório
  final itemAleatorio = lista.escolherItemAleatorio();
  print(
    '\nItem aleatório para comprar: ${itemAleatorio?.nome ?? "Nenhum item pendente"}',
  );

  // Exibindo itens desejados atualizados
  lista.exibirItensDesejados();
}
