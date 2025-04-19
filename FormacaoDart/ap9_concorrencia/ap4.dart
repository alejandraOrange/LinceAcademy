import 'dart:async';

Future<void> main() async {
  await buscarDados();
}

Future<void> buscarDados() async {
  print('Iniciando busca de dados...');
  await Future.delayed(Duration(seconds: 1)); // Simula o início da busca

  print(' Buscando dados... (meio da operação)');
  await Future.delayed(Duration(seconds: 2)); // Simula processamento

  print(' Dados encontrados! (fim da busca)');
}
