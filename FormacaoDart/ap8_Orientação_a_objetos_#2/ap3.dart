abstract class Motor {
  void ligarMotor();
}

abstract class Roda {
  void girarRodas();
}

class Carro implements Motor, Roda {
  @override
  void ligarMotor() {
    print("O carro esta ligando o Motor");
  }

  @override
  void girarRodas() {
    print("As rodas do carro estão girando");
  }
}

void main() {
  Carro carro = Carro();

  carro.ligarMotor();
  carro.girarRodas();
}
