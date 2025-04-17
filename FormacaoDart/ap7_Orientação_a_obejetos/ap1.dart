class ContaBancaria {
  String titular;
  double saldo;

  ContaBancaria(this.titular, this.saldo);

  void depositar(double valor) {
    saldo += valor;
    print("Deposito de R\$${valor.toStringAsFixed(2)} realizado.");
  }

  void sacar(double valor) {
    if (saldo >= valor) {
      saldo -= valor;
      print("Saque de R\$${valor.toStringAsFixed(2)} realizado.");
    } else {
      print("Saldo insuficiente para sacar R\$${valor.toStringAsFixed(2)}.");
    }
  }

  void mostrarSaldo() {
    print("Saldo atual: R\$${saldo.toStringAsFixed(2)}");
  }
}

void main() {
  //criando uma conta
  ContaBancaria conta = ContaBancaria("Derdlim", 5000.00);

  conta.mostrarSaldo();
  conta.depositar(2500.99);
  conta.sacar(1500.00);
  conta.mostrarSaldo();
}
