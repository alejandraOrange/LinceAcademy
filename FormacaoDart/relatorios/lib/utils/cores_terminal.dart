// lib/utils/cores_terminal.dart

class CoresTerminal {
  // Cores básicas
  static String reset = '\x1B[0m';
  static String preto = '\x1B[30m';
  static String vermelho = '\x1B[31m';
  static String verde = '\x1B[32m';
  static String amarelo = '\x1B[33m';
  static String azul = '\x1B[34m';
  static String magenta = '\x1B[35m';
  static String cyan = '\x1B[36m';
  static String branco = '\x1B[37m';

  // Cores específicas para os relatórios climáticos
  static String temperaturaCelsius = '\x1B[31m';    // Vermelho
  static String temperaturaFahrenheit = '\x1B[33m'; // Amarelo
  static String temperaturaKelvin = '\x1B[34m';     // Azul

  static String umidadeMedia = '\x1B[32m';          // Verde
  static String umidadeMaxima = '\x1B[31m';         // Vermelho
  static String umidadeMinima = '\x1B[34m';         // Azul

  static String direcaoVento = '\x1B[33m';          // Amarelo

  // Estilos
  static String negrito = '\x1B[1m';
  static String sublinhado = '\x1B[4m';

  // Métodos auxiliares
  static String formatar(String texto, String cor) => '$cor$texto$reset';

  // Métodos específicos para cada tipo de dado
  static String tempCelsius(String texto) => formatar(texto, temperaturaCelsius);
  static String tempFahrenheit(String texto) => formatar(texto, temperaturaFahrenheit);
  static String tempKelvin(String texto) => formatar(texto, temperaturaKelvin);

  static String umidMedia(String texto) => formatar(texto, umidadeMedia);
  static String umidMaxima(String texto) => formatar(texto, umidadeMaxima);
  static String umidMinima(String texto) => formatar(texto, umidadeMinima);

  static String ventoDirecao(String texto) => formatar(texto, direcaoVento);

  // Para títulos e cabeçalhos
  static String titulo(String texto) => formatar(texto, cyan + negrito);
  static String cabecalhoSecao(String texto) => formatar(texto, amarelo + negrito);
  static String cabecalhoItem(String texto) => formatar(texto, azul);
  static String erro(String texto) => formatar(texto, vermelho + negrito);
  static String sucesso(String texto) => formatar(texto, verde + negrito);
}