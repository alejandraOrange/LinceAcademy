abstract class comportamentoAlimentar {
  void comer();
}

abstract class comportamentoDescanso {
  void dormir();
}

class Camelo implements comportamentoAlimentar, comportamentoDescanso {
  @override
  void comer() {
    print("O camelo está comendo");
  }

  @override
  void dormir() {
    print("O camelo está dormindo");
  }
}

void main() {
  Camelo camelo = Camelo();

  camelo.comer();
  camelo.dormir();
}
