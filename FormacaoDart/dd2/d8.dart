import 'dart:collection';
import 'dart:math';

class Figura {
  final int codigo;
  final String nome;

  Figura(this.codigo, this.nome);

  @override
  String toString() => '[$codigo] $nome';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Figura && codigo == other.codigo;

  @override
  int get hashCode => codigo.hashCode;
}

// Classe com as 20 figurinhas possíveis
class ColecaoFiguras {
  static final List<Figura> todas = List<Figura>.generate(
    20,
    (i) => Figura(i + 1, 'Figura ${i + 1}'),
  );
}

// Pacote de 4 figurinhas aleatórias
class PacoteDeFiguras {
  final List<Figura> figuras;

  PacoteDeFiguras()
    : figuras = List<Figura>.generate(
        4,
        (_) => ColecaoFiguras.todas[Random().nextInt(20)],
      );
}

// Álbum com controle de figurinhas coladas e repetidas
class Album {
  final SplayTreeSet<Figura> _figurinhasColadas = SplayTreeSet<Figura>(
    (a, b) => a.codigo.compareTo(b.codigo),
  );
  final List<Figura> _repetidas = [];

  void adicionarPacote(PacoteDeFiguras pacote) {
    for (var figura in pacote.figuras) {
      if (!_figurinhasColadas.add(figura)) {
        _repetidas.add(figura);
      }
    }
  }

  void imprimirFigurinhas() {
    print('\nFigurinhas coladas no álbum (ordenadas):');
    for (var figura in _figurinhasColadas) {
      print(figura);
    }
  }

  bool get completo => _figurinhasColadas.length == 20;
  int get quantidadeRepetidas => _repetidas.length;
}

void main() {
  final album = Album();
  int pacotesAbertos = 0;

  while (!album.completo) {
    album.adicionarPacote(PacoteDeFiguras());
    pacotesAbertos++;
  }

  print('\nÁlbum completo após abrir $pacotesAbertos pacotes!');
  print('Total de figurinhas repetidas: ${album.quantidadeRepetidas}');
  album.imprimirFigurinhas();
}
