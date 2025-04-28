import 'dart:io';
import 'package:path/path.dart' as path;
import 'gerarRelatorio.dart';

void main() async {
  final dir = Directory(path.join('relatorios_globais'));
  if (!await dir.exists()) await dir.create();

  print('''
  ===========================================
  🌍 RELATÓRIOS CLIMÁTICOS GLOBAIS - MULTIUNIDADE
  ===========================================
  ''');

  while (true) {
    print('\nMENU PRINCIPAL');
    print('1. Relatório de Temperatura (C° / F° / K)');
    print('2. Relatório de Umidade');
    print('3. Relatório de Vento (m/s / km/h / mph)');
    print('4. Sair');
    print('------------------------------------------');

    final input = stdin.readLineSync();
    final opcao = int.tryParse(input ?? '') ?? 0;

    if (opcao == 4) {
      print('\n🌐 Relatório global gerado para todas as filiais. Até logo!');
      break;
    }

    if (![1, 2, 3].contains(opcao)) {
      print('\n⚠️  Opção inválida! Digite 1, 2, 3 ou 4');
      continue;
    }

    print('\n⏳ Gerando relatório multiunidade...');
    await GeradorRelatorios.gerarRelatorio(opcao, dir);
  }
}