import 'dart:async';

// Interface que declara o método abstrato
abstract class Arquivo {
  Future<void> abrir();
}

// Classe que implementa a interface
class ArquivoTexto implements Arquivo {
  final String _nome;

  ArquivoTexto(this._nome);

  @override
  Future<void> abrir() async {
    try {
      // Simula erro se o nome for vazio ou apenas espaços
      if (_nome.trim().isEmpty) {
        throw Exception();
      }
      print('Abrindo o arquivo $_nome...');
    } catch (e) {
      throw Exception('Erro ao abrir o arquivo $_nome');
    }
  }
}

Future<String> lerEntrada() {
  return Future<String>.value('nome_do_arquivo.txt'); // Simula entrada
}

void main() async {
  try {
    print('Digite o nome do arquivo: ');
    String entrada = await lerEntrada();

    if (entrada.trim().isEmpty) {
      throw Exception('Entrada invalida. Digite um nome valido.');
    }

    final arquivo = ArquivoTexto(entrada);

    try {
      await arquivo.abrir();
    } catch (e) {
      rethrow; // Relança a exceção lançada por abrir()
    }
  } catch (e) {
    print(e);
  } finally {
    print('Fim do programa');
  }
}
