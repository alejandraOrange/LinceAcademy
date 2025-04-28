import '../../models/medida_climatica.dart';
import '../../utils/string_utils.dart';

class UmidadeReport {
  static void gerarRelatorio(Map<String, List<MedidaClimatica>> dadosPorEstado) {
    print('--- Relatório de Umidade do Ar ---');
    dadosPorEstado.forEach((estado, medidas) {
      print('\n--- Estado: $estado ---');

      // Média por Ano
      final mediasPorAno = calculateAverageByYear(medidas, (m) => m.umidade);
      print('Média por Ano:');
      mediasPorAno.forEach((ano, media) => print('$ano: ${media.toStringAsFixed(2)} %'));

      // Média por Mês
      final mediasPorMes = calculateAverageByMonth(medidas, (m) => m.umidade);
      print('\nMédia por Mês:');
      mediasPorMes.forEach((mes, media) => print('${getNomeMes(mes)}: ${media.toStringAsFixed(2)} %'));

      // Máxima por Ano
      final maximasPorAno = calculateExtremeByYear(medidas, (m) => m.umidade, (a, b) => a > b);
      print('\nMáxima por Ano:');
      maximasPorAno.forEach((ano, maxima) => print('$ano: ${maxima.toStringAsFixed(2)} %'));

      // Máxima por Mês
      final maximasPorMes = calculateExtremeByMonth(medidas, (m) => m.umidade, (a, b) => a > b);
      print('\nMáxima por Mês:');
      maximasPorMes.forEach((mes, maxima) => print('${getNomeMes(mes)}: ${maxima.toStringAsFixed(2)} %'));

      // Mínima por Ano
      final minimasPorAno = calculateExtremeByYear(medidas, (m) => m.umidade, (a, b) => a < b);
      print('\nMínima por Ano:');
      minimasPorAno.forEach((ano, minima) => print('$ano: ${minima.toStringAsFixed(2)} %'));

      // Mínima por Mês
      final minimasPorMes = calculateExtremeByMonth(medidas, (m) => m.umidade, (a, b) => a < b);
      print('\nMínima por Mês:');
      maximasPorMes.forEach((mes, minima) => print('${getNomeMes(mes)}: ${minima.toStringAsFixed(2)} %'));
    });
  }

  static Map<int, double> calculateAverageByYear(List<MedidaClimatica> medidas, double Function(MedidaClimatica) getValue) {
    final grouped = groupBy<MedidaClimatica, int>(medidas, (m) => m.ano);
    return grouped.map((ano, lista) => MapEntry(ano, lista.map(getValue).reduce((a, b) => a + b) / lista.length));
  }

  static Map<int, double> calculateAverageByMonth(List<MedidaClimatica> medidas, double Function(MedidaClimatica) getValue) {
    final grouped = groupBy<MedidaClimatica, int>(medidas, (m) => m.mes);
    return grouped.map((mes, lista) => MapEntry(mes, lista.map(getValue).reduce((a, b) => a + b) / lista.length));
  }

  static Map<int, double> calculateExtremeByYear(List<MedidaClimatica> medidas, double Function(MedidaClimatica) getValue, bool Function(double, double) compare) {
    final grouped = groupBy<MedidaClimatica, int>(medidas, (m) => m.ano);
    return grouped.map((ano, lista) {
      if (lista.isEmpty) return MapEntry(ano, double.nan);
      double extreme = getValue(lista.first);
      for (final medida in lista.skip(1)) {
        if (compare(getValue(medida), extreme)) {
          extreme = getValue(medida);
        }
      }
      return MapEntry(ano, extreme);
    });
  }

  static Map<int, double> calculateExtremeByMonth(List<MedidaClimatica> medidas, double Function(MedidaClimatica) getValue, bool Function(double, double) compare) {
    final grouped = groupBy<MedidaClimatica, int>(medidas, (m) => m.mes);
    return grouped.map((mes, lista) {
      if (lista.isEmpty) return MapEntry(mes, double.nan);
      double extreme = getValue(lista.first);
      for (final medida in lista.skip(1)) {
        if (compare(getValue(medida), extreme)) {
          extreme = getValue(medida);
        }
      }
      return MapEntry(mes, extreme);
    });
  }
}