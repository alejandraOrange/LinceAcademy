import 'dart:collection';

void main() {
  final baralho = Baralho();

  // Adicionando cartas na ordem especificada
  baralho.empilharCarta(Carta('A', Naipe.paus));
  baralho.empilharCarta(Carta('A', Naipe.copas));
  baralho.empilharCarta(Carta('A', Naipe.espadas));
  baralho.empilharCarta(Carta('A', Naipe.ouros));

  print('Baralho completo:');
  baralho.imprimirBaralho();

  print('\nRemovendo cartas uma por uma:');
  while (!baralho.estaVazio) {
    final cartaRemovida = baralho.removerCarta();
    print(
      'Carta removida: ${cartaRemovida.valor} de ${cartaRemovida.naipe.name}',
    );
  }

  print('\nBaralho após remoção:');
  baralho.imprimirBaralho();
}

enum Naipe {
  paus('\u2663'),
  copas('\u2665'),
  espadas('\u2660'),
  ouros('\u2666');

  const Naipe(this.simbolo);
  final String simbolo;
}

class Carta {
  final String valor;
  final Naipe naipe;

  Carta(this.valor, this.naipe) {
    if (valor.isEmpty)
      throw ArgumentError('O valor da carta não pode ser vazio');
  }

  @override
  String toString() => '$valor${naipe.simbolo}';
}

class Baralho {
  final Queue<Carta> _cartas = Queue();

  bool get estaVazio => _cartas.isEmpty;

  void empilharCarta(Carta carta) {
    _cartas.addLast(carta); // Empilha no topo (final da queue)
  }

  Carta removerCarta() {
    if (estaVazio) throw StateError('O baralho está vazio');
    return _cartas.removeLast(); // Remove do topo (último item)
  }

  void imprimirBaralho() {
    if (estaVazio) {
      print('O baralho está vazio');
      return;
    }

    print('Cartas no baralho (do topo para a base):');
    // Convertemos para lista para poder iterar na ordem inversa
    final cartas = _cartas.toList().reversed;
    for (final carta in cartas) {
      print(carta);
    }
  }
}
