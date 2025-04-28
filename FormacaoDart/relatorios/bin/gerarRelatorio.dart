import 'dart:io';
import 'dart:math';

// Cores ANSI para terminal
class Cores {
  static const vermelho = '\x1B[31m';
  static const verde = '\x1B[32m';
  static const amarelo = '\x1B[33m';
  static const azul = '\x1B[34m';
  static const magenta = '\x1B[35m';
  static const ciano = '\x1B[36m';
  static const reset = '\x1B[0m';
}

// Conversões de unidades
class Conversor {
  static double celsiusParaFahrenheit(double c) => c * 9/5 + 32;
  static double celsiusParaKelvin(double c) => c + 273.15;
  static double msParaKmh(double ms) => ms * 3.6;
  static double msParaMph(double ms) => ms * 2.237;
  static double grausParaRadianos(double graus) => graus * pi / 180;
}

// Modelo para dados climáticos
class DadosClimaticos {
  final String estado;
  final DateTime data;
  final double temperatura;
  final double umidade;
  final double velocidadeVento;
  final double direcaoVento;

  DadosClimaticos({
    required this.estado,
    required this.data,
    required this.temperatura,
    required this.umidade,
    required this.velocidadeVento,
    required this.direcaoVento,
  });
}

// Processamento de estatísticas
class Estatisticas {
  static Map<String, dynamic> calcular(List<DadosClimaticos> dados) {
    if (dados.isEmpty) return {};

    final temps = dados.map((d) => d.temperatura).toList();
    final umidades = dados.map((d) => d.umidade).toList();
    final ventos = dados.map((d) => d.velocidadeVento).toList();
    final direcoes = dados.map((d) => d.direcaoVento).toList();

    // Cálculo de moda (direção mais frequente)
    final freq = <double, int>{};
    for (final d in direcoes) {
      freq[d] = (freq[d] ?? 0) + 1;
    }
    final moda = freq.entries.reduce((a, b) => a.value > b.value ? a : b).key;

    return {
      'temp_media': _media(temps),
      'temp_max': temps.reduce(max),
      'temp_min': temps.reduce(min),
      'umidade_media': _media(umidades),
      'umidade_max': umidades.reduce(max),
      'umidade_min': umidades.reduce(min),
      'vento_medio': _media(ventos),
      'vento_max': ventos.reduce(max),
      'direcao_moda': moda,
    };
  }

  static double _media(List<double> valores) {
    return valores.reduce((a, b) => a + b) / valores.length;
  }
}

// Geração de relatórios
class GeradorRelatorios {
  static Future<void> gerarRelatorio(int opcao, Directory dir) async {
    try {
      final agora = DateTime.now();
      final arquivo = File('lib/dado/SC_${agora.year}_${agora.month}.csv');

      if (!await arquivo.exists()) {
        throw Exception('Arquivo não encontrado: ${arquivo.path}');
      }

      final linhas = await arquivo.readAsLines();
      if (linhas.isEmpty) throw Exception('Arquivo vazio');

      final dados = _processarDados(linhas);
      final estatisticas = Estatisticas.calcular(dados);

      switch (opcao) {
        case 1:
          _gerarRelatorioTemperatura(estatisticas, dir);
          break;
        case 2:
          _gerarRelatorioUmidade(estatisticas, dir);
          break;
        case 3:
          _gerarRelatorioVento(estatisticas, dir);
          break;
        default:
          throw Exception('Opção inválida');
      }

    } catch (e) {
      print('${Cores.vermelho}❌ ERRO: ${e.toString()}${Cores.reset}');
    }
  }

  static List<DadosClimaticos> _processarDados(List<String> linhas) {
    return linhas.skip(1).map((linha) {
      final valores = linha.split(',');
      return DadosClimaticos(
        estado: valores[0],
        data: DateTime.parse(valores[1]),
        temperatura: double.parse(valores[2]),
        umidade: double.parse(valores[3]),
        velocidadeVento: double.parse(valores[4]),
        direcaoVento: double.parse(valores[5]),
      );
    }).toList();
  }

  static void _gerarRelatorioTemperatura(Map<String, dynamic> stats, Directory dir) {
    final c = stats['temp_media'];
    final f = Conversor.celsiusParaFahrenheit(c);
    final k = Conversor.celsiusParaKelvin(c);

    final relatorio = File('${dir.path}/temperatura_${DateTime.now().year}.txt');
    relatorio.writeAsStringSync('''
${Cores.vermelho}=== TEMPERATURA (Celsius) ===${Cores.reset}
Média anual: ${c.toStringAsFixed(2)}°C
Máxima anual: ${stats['temp_max']}°C
Mínima anual: ${stats['temp_min']}°C

${Cores.amarelo}=== TEMPERATURA (Fahrenheit) ===${Cores.reset}
Média anual: ${f.toStringAsFixed(2)}°F
Máxima anual: ${Conversor.celsiusParaFahrenheit(stats['temp_max'])}°F
Mínima anual: ${Conversor.celsiusParaFahrenheit(stats['temp_min'])}°F

${Cores.azul}=== TEMPERATURA (Kelvin) ===${Cores.reset}
Média anual: ${k.toStringAsFixed(2)}K
Máxima anual: ${Conversor.celsiusParaKelvin(stats['temp_max'])}K
Mínima anual: ${Conversor.celsiusParaKelvin(stats['temp_min'])}K
''');

    print(relatorio.readAsStringSync());
  }

  static void _gerarRelatorioUmidade(Map<String, dynamic> stats, Directory dir) {
    final relatorio = File('${dir.path}/umidade_${DateTime.now().year}.txt');
    relatorio.writeAsStringSync('''
${Cores.verde}=== UMIDADE (Médias) ===${Cores.reset}
Média anual: ${stats['umidade_media'].toStringAsFixed(2)} g/kg

${Cores.vermelho}=== UMIDADE (Máximas) ===${Cores.reset}
Máxima anual: ${stats['umidade_max']} g/kg

${Cores.azul}=== UMIDADE (Mínimas) ===${Cores.reset}
Mínima anual: ${stats['umidade_min']} g/kg
''');

    print(relatorio.readAsStringSync());
  }

  static void _gerarRelatorioVento(Map<String, dynamic> stats, Directory dir) {
    final ms = stats['vento_medio'];
    final kmh = Conversor.msParaKmh(ms);
    final mph = Conversor.msParaMph(ms);
    final radianos = Conversor.grausParaRadianos(stats['direcao_moda']);

    final relatorio = File('${dir.path}/vento_${DateTime.now().year}.txt');
    relatorio.writeAsStringSync('''
=== VELOCIDADE DO VENTO ===
Média anual: ${ms.toStringAsFixed(2)} m/s
Média anual: ${kmh.toStringAsFixed(2)} km/h
Média anual: ${mph.toStringAsFixed(2)} mph

${Cores.amarelo}=== DIREÇÃO DO VENTO ===${Cores.reset}
Direção mais frequente: ${stats['direcao_moda']}°
Direção mais frequente: ${radianos.toStringAsFixed(4)} rad
''');

    print(relatorio.readAsStringSync());
  }
}