class MedidaClimatica {
  final String estado;
  final int ano;
  final int mes;
  final int dia;
  final int hora;
  final double temperaturaCelsius;
  final double umidade;
  final double velocidadeVentoMps;
  final int direcaoVentoGraus;

  MedidaClimatica({
    required this.estado,
    required this.ano,
    required this.mes,
    required this.dia,
    required this.hora,
    required this.temperaturaCelsius,
    required this.umidade,
    required this.velocidadeVentoMps,
    required this.direcaoVentoGraus,
  });
}