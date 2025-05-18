## 1. O que é programação assíncrona em Flutter e por que ela é importante?
Programação assíncrona permite que o app realize tarefas demoradas (como chamadas HTTP ou leitura de arquivos) sem bloquear a interface do usuário (UI).
No Flutter, isso é essencial porque tudo roda em uma única thread principal (UI thread). Se você bloquear essa thread, o app "trava".

## 2. Quais cuidados devo ter usando programação assíncrona?
Sempre use await para esperar operações assíncronas quando necessário.

Evite async sem await, pois pode gerar comportamentos inesperados.

Use try-catch para tratar erros.

Não manipule diretamente a UI dentro de operações muito pesadas — use Isolates se necessário.

## 3. O que são isolates em Flutter?
Isolates são threads separadas que não compartilham memória com a thread principal.
Eles são usados para tarefas pesadas, como cálculos complexos ou parsing de arquivos grandes, para evitar travar a UI.

## 4. Cuidados ao usar isolates em Flutter
Comunicação entre isolates deve ser feita com portas e mensagens (não há memória compartilhada).

Nem todo código pode ser executado em isolates — você não pode manipular widgets lá.

Use compute() para tarefas simples em segundo plano.

## 5. Conceito do Loop de Eventos em Flutter
Flutter (e Dart) usa um Event Loop, como em JavaScript. Isso significa que:

Eventos e tarefas são colocados em uma fila.

A UI só responde quando a thread principal está livre.

Funções async entram na fila e são executadas quando possível.

## 6. O que é um `Future` em Dart e como ele funciona?
Um `Future` representa um valor que estará disponível no futuro, como o resultado de uma chamada HTTP.
Ele pode estar em três estados:

`Uncompleted`

`Completed with value`

`Completed with error`

✅ 7. Como usar 'async' e 'await' com 'Futures'?

```dart
Future<void> buscarDados() async {
  var resposta = await http.get(Uri.parse('https://exemplo.com'));
  print(resposta.body);
}
```

`async` marca a função como assíncrona.

`await` espera a conclusão do `Future`.

## 8. Como lidar com erros em operações assíncronas usando 'try-catch'?

```dart
try {
  var resposta = await http.get(Uri.parse('https://exemplo.com'));
  print(resposta.body);
} catch (e) {
  print('Erro ao buscar dados: $e');
}
```

Sempre trate falhas de rede ou conversão com try-catch.

## 9. Métodos HTTP
`GET`: busca dados.

`POST`: envia novos dados.

`PUT`: substitui dados existentes.

`PATCH`: atualiza parcialmente.

`DELETE`: remove dados.

## 10. Como lidar com diferentes códigos de resposta HTTP

```dart
if (resposta.statusCode == 200) {
  // Sucesso
} else if (resposta.statusCode == 404) {
  // Não encontrado
} else if (resposta.statusCode == 500) {
  // Erro do servidor
}
```

Sempre verifique statusCode antes de usar body.

## 11. O que é JSON e como ele é usado em Flutter?
JSON (JavaScript Object Notation) é um formato de texto leve para troca de dados.
No Flutter, ele é usado para enviar/receber dados de APIs.

🔍 12. Como acessar valores específicos em um objeto JSON?
var dados = jsonDecode(resposta.body);
print(dados['nome']);
📋 13. Como lidar com arrays (listas) em JSON em Flutter?
[
  { "nome": "João" },
  { "nome": "Maria" }
]
var lista = jsonDecode(resposta.body);
print(lista[0]['nome']);
🔁 14. Como iterar sobre os elementos de um array JSON?
for (var item in lista) {
  print(item['nome']);
}
🧱 15. Por que é útil mapear JSON para classes Dart?
Melhora a legibilidade, manutenção e tipagem do código.

Permite usar objetos diretamente ao invés de Map<String, dynamic>.

🏭 16. Como usar 'factory' para criar objetos Dart a partir de JSON?
class Pessoa {
  final String nome;
  Pessoa({required this.nome});

  factory Pessoa.fromJson(Map<String, dynamic> json) {
    return Pessoa(nome: json['nome']);
  }
}
🔄 17. Como usar 'toJson()' para converter objetos Dart em JSON?
class Pessoa {
  final String nome;

  Map<String, dynamic> toJson() => {
    'nome': nome,
  };
}
🧩 18. Como organizar requisições no código Flutter?
Crie um serviço separado, por exemplo:

class ApiService {
  final String baseUrl = 'https://exemplo.com/api';

  Future<List<Pessoa>> buscarPessoas() async {
    final resposta = await http.get(Uri.parse('$baseUrl/pessoas'));
    if (resposta.statusCode == 200) {
      final List dados = jsonDecode(resposta.body);
      return dados.map((e) => Pessoa.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao buscar pessoas');
    }
  }
}
Se quiser, posso te ajudar a criar um modelo prático com tudo isso funcionando em Flutter. Deseja um exemplo com tela, requisição, exibição e tratamento de erros?






Buscar

Refletir

Investigar

Criar imagem



Nenhum arquivo escolhidoNenhum arquivo escolhido
O ChatGPT pode cometer erros. Considere verificar informações importantes.
