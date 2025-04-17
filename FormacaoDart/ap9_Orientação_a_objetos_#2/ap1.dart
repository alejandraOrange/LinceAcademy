abstract class Animal {
  void comer();
  void beber();
}

class Gato extends Animal {
  @override
  void comer() {
    print("O Gato esta comendo.");
  }

  @override
  void beber() {
    print("O gato esta bebendo,");
  }

  void miar() {
    print("O gato esta miando");
  }
}

void main() {
  Gato meuGato = Gato();
  meuGato.beber();
  meuGato.comer();
  meuGato.miar();
}
