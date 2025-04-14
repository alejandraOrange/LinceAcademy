bool ehAnoBissexto(int ano) {
  if ((ano % 4 == 0 && ano % 100 != 0) || (ano % 400 == 0)) {
    return true;
  } else {
    return false;
  }
}

void main() {
  List<int> anos = [2016, 1988, 2100, 2300, 1993];

  for (var ano in anos) {
    if (ehAnoBissexto(ano)) {
      print("Oano $ano eh bissexto");
    } else {
      print("O ano $ano nao eh bissexto");
    }
  }
}
