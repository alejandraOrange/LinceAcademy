void main() {
  DateTime dataAtual = DateTime(2022, 9, 5);
  int diasUteis = 0;
  DateTime dataCalculada = dataAtual;

  while (diasUteis < 18) {
    dataCalculada = dataCalculada.add(Duration(days: 1));
    if (dataCalculada.weekday != DateTime.saturday &&
        dataCalculada.weekday != DateTime.sunday) {
      diasUteis++;
    }
  }

  final formatador = DateFormat('dd/MM/yyyy');

  print('Data atual: ${formatador.format(dataAtual)}');
  print('Data calculada: ${formatador.format(dataCalculada)}');
}
