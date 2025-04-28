import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path/path.dart';

class Dados {
  final String estado;
  final DateTime dataHora;
  final double temperatura;
  final double umidade;
  final double velVento;
  final double dirVento;

  Dados({
    required this.estado,
    required this.dataHora,
    required this.temperatura,
    required this.umidade,
    required this.velVento,
    required this.dirVento,
  });

  @override
  String toString() {
    return 'Dados{estado: $estado, dataHora: $dataHora, temperatura: $temperatura, umidade: $umidade, velVento: $velVento, dirVento: $dirVento}';
  }
}

Future<List<Dados>> lerArquivos(Directory dir) async {
  if (!await dir.exists()) {
    throw Exception("Diretório não encontrado em: ${dir.path}");
  }

  List<Dados> registros = [];
  // Filtra apenas os arquivos CSV de Santa Catarina.
  final arquivosSC = dir
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.csv') && basename(f.path).startsWith('SC_'));

  print("Arquivos CSV de SC encontrados na pasta 'dado':");
  for (final file in arquivosSC) { // Corrigido: 'for in' para 'for (final file in arquivosSC)'
    final nomeArquivo = basename(file.path);
    final partesNome = nomeArquivo.split('_');
    if (partesNome.length >= 3 && partesNome[0].toUpperCase() == 'SC') {
      // Extrai ano e mês do nome do arquivo
      final ano = int.tryParse(partesNome[1]) ?? DateTime.now().year;
      final mes = int.tryParse(partesNome[2].split('.').first) ?? 1; // Pega o mês do nome do arquivo

      final conteudo = await file.readAsString(encoding: utf8);
      final linhas = const CsvToListConverter().convert(conteudo);

      if (linhas.isNotEmpty &&
          linhas.first.length >=
              13) { // Garante que o cabeçalho tenha pelo menos 13 colunas
        for (int i = 1; i < linhas.length; i++) {
          final linhaDados = linhas[i];
          if (linhaDados.length >= 13) {
            // Usa o ano e mês extraídos do nome do arquivo.
            try {
              final dia = int.tryParse(linhaDados[1].toString()) ?? 1;
              final hora = int.tryParse(linhaDados[2].toString()) ?? 0;
              final dataHora = DateTime(ano, mes, dia, hora);
              final temperatura =
                  double.tryParse(linhaDados[3].toString()) ?? 0.0;
              final umidade =
                  (double.tryParse(linhaDados[8].toString()) ?? 0.0) / 100;
              final velocidadeVento =
                  double.tryParse(linhaDados[11].toString()) ?? 0.0;
              final ventoDirecao =
                  double.tryParse(linhaDados[12].toString()) ?? 0.0;

              registros.add(Dados(
                estado: 'SC',
                dataHora: dataHora,
                temperatura: temperatura,
                umidade: umidade,
                velVento: velocidadeVento,
                dirVento: ventoDirecao,
              ));
            } catch (e) {
              print(
                  'Erro ao processar linha em $nomeArquivo: $linhaDados - $e');
            }
          } else {
            print(
                'Aviso: Linha com número incorreto de colunas em $nomeArquivo: $linhaDados');
          }
        }
      } else {
        print(
            'Aviso: Arquivo CSV de SC vazio ou com cabeçalho incompleto: $nomeArquivo');
      }
    } else {
      print(
          'Aviso: Nome de arquivo de SC inválido: $nomeArquivo. Formato esperado: SC_[ANO]_[MÊS].CSV');
    }
  }
  return registros; // Corrigido: 'return registro' para 'return registros'
}
