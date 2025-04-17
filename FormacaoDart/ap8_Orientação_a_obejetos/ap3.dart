class Produto {
  String nome = '';
  double preco = 0.0;

  double desconto(double percentual) {
    return preco - (preco * (percentual / 100));
  }
}

void main() {
  List<Produto> produtos = [];
  List<String> nomes = ['cores', 'canetas', 'oculos', 'pincel', 'tela'];
  List<double> precos = [255.5, 189.9, 1144.8, 40.0, 10.0];

  for (int i = 0; i < nomes.length; i++) {
    Produto produto = Produto();
    produto.nome = nomes[i];
    produto.preco = precos[i];
    produtos.add(produto);
  }

  for (Produto produto in produtos) {
    print('Produto: ${produto.nome}, Preço: ${produto.preco.toStringAsFixed(2)}, Desconto 10%: ${produto.desconto(10).toStringAsFixed(2)}');
  }