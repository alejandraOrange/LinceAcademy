import 'dart:io';
import 'package:relatorios/models/medida_climatica.dart';

class CSVUtils {
  static Future<List<FileSystemEntity>> getArquivos(String diretorio) async {
    final directory = Directory(diretorio);
    if (await directory.exists()) {
      return directory.list().where((entity) => entity is File && entity.path.toLowerCase().endsWith('.csv')).toList();
    } else {
      print('Diretório não encontrado: $diretorio');
      return [];
    }
  }

  static Future<List<MedidaClimatica>> lerArquivo(File arquivo) async {
    List<MedidaClimatica> medidas = [];
    try {
      final linhas = await arquivo.readAsLines();
      if (linhas.length > 1) {
        final cabecalho = linhas[0].split(',');
        final estadoSigla = arquivo.path.split('/').last.split('_')[0].toUpperCase();
        final ano = int.parse(arquivo.path.split('/').last.split('_')[1]);
        final mes = int.parse(arquivo.path.split('/').last.split('_')[2].replaceAll('.csv', ''));

        int? diaIndex = cabecalho.indexOf('Dia');
        int? horaIndex = cabecalho.indexOf('Hora');
        int? temperaturaIndex = cabecalho.indexOf('Temperatura (C)');
        int? umidadeIndex = cabecalho.indexOf('Umidade (%)');
        int? velocidadeVentoIndex = cabecalho.indexOf('Velocidade do Vento (m/s)'); // Adapte o nome
        int? direcaoVentoIndex = cabecalho.indexOf('Direção do Vento (Graus)');   // Adapte o nome

        for (int i = 1; i < linhas.length; i++) {
          final valores = linhas[i].split(',');
          if (valores.length == cabecalho.length) {
            try {
              final dia = int.parse(valores[diaIndex]);
              final hora = int.parse(valores[horaIndex]);
              final temperaturaCelsius = double.parse(valores[temperaturaIndex]);
              final double umidade = double.parse(valores[umidadeIndex]);
              final double velocidadeVentoMps = double.parse(valores[velocidadeVentoIndex]);
              final int direcaoVentoGraus = int.parse(valores[direcaoVentoIndex]);

              medidas.add(
                MedidaClimatica(
                  estado: estadoSigla,
                  ano: ano,
                  mes: mes,
                  dia: dia,
                  hora: hora,
                  temperaturaCelsius: temperaturaCelsius,
                  umidade: umidade,
                  velocidadeVentoMps: velocidadeVentoMps,
                  direcaoVentoGraus: direcaoVentoGraus,
                ),
              );
            } catch (e) {
              print('Erro ao analisar linha do arquivo ${arquivo.path}: $e - Linha: ${linhas[i]}');
            }
          } else {
            print('Número de colunas incorreto na linha do arquivo ${arquivo.path}: ${linhas[i]}');
          }
        }
            }
    } catch (e) {
      print('Erro ao ler o arquivo ${arquivo.path}: $e');
    }
    return medidas;
  }
}