import '../../models/medida_climatica.dart';
import '../../utils/string_utils.dart';
import 'dart:math';

class VentoReport {
  static void gerarRelatorio(Map<String, List<MedidaClimatica>> dadosPorEstado) {
    print('--- Relatório de Vento ---');
    dadosPorEstado.forEach((estado, medidas) {
      print('\n--- Estado: $estado ---');

      // Direção do Vento com Maior Frequência por Estado por Ano
      final direcaoFrequenteAno = _calcularDirecaoVentoFrequentePorAno(medidas);
      print('Direção do Vento Mais Frequente por Ano:');
      direcaoFrequenteAno.forEach((ano, direcao) {
        final radianos = direcao * (pi / 180);
        print('$ano: $direcao° (${radianos.toStringAsFixed(2)} rad)');
      });

      // Direção do Vento com Maior Frequência por Estado por Mês
      final direcaoFrequenteMes = _calcularDirecaoVentoFrequentePorMes(medidas);
      print('\nDireção do Vento Mais Frequente por Mês:');
      direcaoFrequenteMes.forEach((mes, direcao) {
        final radianos = direcao * (pi / 180);
        print('${getNomeMes(mes)}: $direcao° (${radianos.toStringAsFixed(2)} rad)');
      });
    });
  }

  static Map<int, int> _calcularDirecaoVentoFrequentePorAno(List<MedidaClimatica> medidas) {
    final groupedByYear = groupBy<MedidaClimatica, int>(medidas, (m) => m.ano);
    return groupedByYear.map((ano, lista) {
      final direcoes = lista.map((m) => m.direcaoVentoGraus).toList();
      final frequencia = <int, int>{};
      for (final direcao in direcoes) {
        frequencia[direcao] = (frequencia[direcao] ?? 0) + 1;
      }
      int? moda;
      int maxFrequencia = 0;
      frequencia.forEach((direcao, freq) {
        if (freq > maxFrequencia) {
          maxFrequencia = freq;
          moda = direcao;
        }
      });
      return MapEntry(ano, moda ?? 0);
    });
  }

  static Map<int, int> _calcularDirecaoVentoFrequentePorMes(List<MedidaClimatica> medidas) {
    final groupedByMonth = groupBy<MedidaClimatica, int>(medidas, (m) => m.mes);
    return groupedByMonth.map((mes, lista) {
      final direcoes = lista.map((m) => m.direcaoVentoGraus).toList();
      final frequencia = <int, int>{};
      for (final direcao in direcoes) {
        frequencia[direcao] = (frequencia[direcao] ?? 0) + 1;
      }
      int? moda;
      int maxFrequencia = 0;
      frequencia.forEach((direcao, freq) {
        if (freq > maxFrequencia) {
          maxFrequencia = freq;
          moda = direcao;
        }
      });
      return MapEntry(mes, moda ?? 0);
    });
  }
}