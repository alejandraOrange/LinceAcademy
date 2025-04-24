class Musica {
  final String titulo;
  final String artista;
  final String album;
  final int duracaoSegundos;

  Musica({
    required this.titulo,
    required this.artista,
    required this.album,
    required this.duracaoSegundos,
  });

  String get duracaoFormatada {
    final minutos = duracaoSegundos ~/ 60;
    final segundos = duracaoSegundos % 60;
    return '$minutos:${segundos.toString().padLeft(2, '0')}';
  }

  @override
  String toString() {
    return '$titulo - $artista ($album) [${duracaoFormatada}]';
  }
}

class BibliotecaMusical {
  final List<Musica> _musicas = [];

  void adicionarMusica(Musica musica) {
    _musicas.add(musica);
  }

  int get totalMusicas => _musicas.length;

  double get tempoTotalHoras {
    final totalSegundos = _musicas.fold(
      0,
      (sum, musica) => sum + musica.duracaoSegundos,
    );
    return totalSegundos / 3600;
  }

  void imprimirBiblioteca() {
    print('\n=== BIBLIOTECA MUSICAL ===');
    print('Total de músicas: $totalMusicas');
    print('Duração total: ${tempoTotalHoras.toStringAsFixed(2)} horas\n');

    print('Músicas disponíveis:');
    for (var musica in _musicas) {
      print(musica);
    }
  }

  List<Musica> buscarPorTitulo(String titulo) {
    return _musicas
        .where((m) => m.titulo.toLowerCase().contains(titulo.toLowerCase()))
        .toList();
  }

  List<Musica> buscarPorArtista(String artista) {
    return _musicas
        .where((m) => m.artista.toLowerCase().contains(artista.toLowerCase()))
        .toList();
  }

  List<Musica> buscarPorAlbum(String album) {
    return _musicas
        .where((m) => m.album.toLowerCase().contains(album.toLowerCase()))
        .toList();
  }
}

void main() {
  // Criando a biblioteca
  final biblioteca = BibliotecaMusical();

  // Adicionando músicas
  biblioteca.adicionarMusica(
    Musica(
      titulo: 'Bohemian Rhapsody',
      artista: 'Queen',
      album: 'A Night at the Opera',
      duracaoSegundos: 354,
    ),
  );

  biblioteca.adicionarMusica(
    Musica(
      titulo: 'Imagine',
      artista: 'John Lennon',
      album: 'Imagine',
      duracaoSegundos: 183,
    ),
  );

  biblioteca.adicionarMusica(
    Musica(
      titulo: 'Hotel California',
      artista: 'Eagles',
      album: 'Hotel California',
      duracaoSegundos: 390,
    ),
  );

  biblioteca.adicionarMusica(
    Musica(
      titulo: 'Smells Like Teen Spirit',
      artista: 'Nirvana',
      album: 'Nevermind',
      duracaoSegundos: 301,
    ),
  );

  biblioteca.adicionarMusica(
    Musica(
      titulo: 'Like a Rolling Stone',
      artista: 'Bob Dylan',
      album: 'Highway 61 Revisited',
      duracaoSegundos: 369,
    ),
  );

  // Imprimindo a biblioteca
  biblioteca.imprimirBiblioteca();

  // Realizando buscas
  print('\n=== RESULTADOS DE BUSCA ===');

  print('\nBusca por título contendo "like":');
  final resultadosTitulo = biblioteca.buscarPorTitulo('like');
  for (var musica in resultadosTitulo) {
    print(musica);
  }

  print('\nBusca por artista contendo "queen":');
  final resultadosArtista = biblioteca.buscarPorArtista('queen');
  for (var musica in resultadosArtista) {
    print(musica);
  }

  print('\nBusca por álbum contendo "california":');
  final resultadosAlbum = biblioteca.buscarPorAlbum('california');
  for (var musica in resultadosAlbum) {
    print(musica);
  }
}
