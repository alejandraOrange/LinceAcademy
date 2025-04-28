import 'package:relatorios/models/medida_climatica.dart';
import 'package:relatorios/utils/string_utils.dart';

class TemperaturaReport {
  static void gerarRelatorio(Map<String, List<MedidaClimatica>> dadosPorEstado) {
    print('--- Relatório de Temperatura ---');
    dadosPorEstado.forEach((estado, medidas) {
      print('\n--- Estado: $estado ---');

      // Média por Ano
      final mediasPorAno = calculateAverageByYear(medidas, (m) => m.temperaturaCelsius);
      print('Média por Ano:');
      mediasPorAno.forEach((ano, mediaCelsius) {
        final mediaFahrenheit = (mediaCelsius * 9 / 5) + 32;
        final mediaKelvin = mediaCelsius + 273.15;
        print('$ano: ${mediaCelsius.toStringAsFixed(2)} °C, ${mediaFahrenheit.toStringAsFixed(2)} °F, ${mediaKelvin.toStringAsFixed(2)} K');
      });

      // Média por Mês
      final mediasPorMes = calculateAverageByMonth(medidas, (m) => m.temperaturaCelsius);
      print('\nMédia por Mês:');
      mediasPorMes.forEach((mes, mediaCelsius) {
        final mediaFahrenheit = (mediaCelsius * 9 / 5) + 32;
        final mediaKelvin = mediaCelsius + 273.15;
        print('${getNomeMes(mes)}: ${mediaCelsius.toStringAsFixed(2)} °C, ${mediaFahrenheit.toStringAsFixed(2)} °F, ${mediaKelvin.toStringAsFixed(2)} K');
      });

      // Máxima por Ano
      final maximasPorAno = calculateExtremeByYear(medidas, (m) => m.temperaturaCelsius, (a, b) => a > b);
      print('\nMáxima por Ano:');
      maximasPorAno.forEach((ano, maximaCelsius) {
        final maximaFahrenheit = (maximaCelsius * 9 / 5) + 32;
        final maximaKelvin = maximaCelsius + 273.15;
        print('$ano: ${maximaCelsius.toStringAsFixed(2)} °C, ${maximaFahrenheit.toStringAsFixed(2)} °F, ${maximaKelvin.toStringAsFixed(2)} K');
      });

      // Máxima por Mês
      final maximasPorMes = calculateExtremeByMonth(medidas, (m) => m.temperaturaCelsius, (a, b) => a > b);
      print('\nMáxima por Mês:');
      maximasPorMes.forEach((mes, maximaCelsius) {
        final maximaFahrenheit = (maximaCelsius * 9 / 5) + 32;
        final maximaKelvin = maximaCelsius + 273.15;
        print('${getNomeMes(mes)}: ${maximaCelsius.toStringAsFixed(2)} °C, ${maximaFahrenheit.toStringAsFixed(2)} °F, ${maximaKelvin.toStringAsFixed(2)} K');
      });

      // Mínima por Ano
      final minimasPorAno = calculateExtremeByYear(medidas, (m) => m.temperaturaCelsius, (a, b) => a < b);
      print('\nMínima por Ano:');
      minimasPorAno.forEach((ano, minimaCelsius) {
        final minimaFahrenheit = (minimaCelsius * 9 / 5) + 32;
        final minimaKelvin = minimaCelsius + 273.15;
        print('$ano: ${minimaCelsius.toStringAsFixed(2)} °C, ${minimaFahrenheit.toStringAsFixed(2)} °F, ${minimaKelvin.toStringAsFixed(2)} K');
      });

      // Mínima por Mês
      final minimasPorMes = calculateExtremeByMonth(medidas, (m) => m.temperaturaCelsius, (a, b) => a < b);
      print('\nMínima por Mês:');
      minimasPorMes.forEach((mes, minimaCelsius) {
        final minimaFahrenheit = (minimaCelsius * 9 / 5) + 32;
        final minimaKelvin = minimaCelsius + 273.15;
        print('${getNomeMes(mes)}: ${minimaCelsius.toStringAsFixed(2)} °C, ${minimaFahrenheit.toStringAsFixed(2)} °F, ${minimaKelvin.toStringAsFixed(2)} K');
      });

      // Média por Horário por Estado
      final mediaPorHorario = calculateAverageByHour(medidas, (m) => m.temperaturaCelsius);
      print('\nMédia por Horário:');
      mediaPorHorario.forEach((hora, mediaCelsius) {
        final mediaFahrenheit = (mediaCelsius * 9 / 5) + 32;
        final mediaKelvin = mediaCelsius + 273.15;
        print('${hora.toString().padLeft(2, '0')}h: ${mediaCelsius.toStringAsFixed(2)} °C, ${mediaFahrenheit.toStringAsFixed(2)} °F, ${mediaKelvin.toStringAsFixed(2)} K');
      });
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

  static Map<int, double> calculateAverageByHour(List<MedidaClimatica> medidas, double Function(MedidaClimatica) getValue) {
    final grouped = groupBy<MedidaClimatica, int>(medidas, (m) => m.hora);
    return grouped.map((hora, lista) => MapEntry(hora, lista.map(getValue).reduce((a, b) => a + b) / lista.length));
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