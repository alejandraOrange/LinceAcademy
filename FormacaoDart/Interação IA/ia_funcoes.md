
## Quais cuidados devo ter ao criar funções em dart? 

✅ 1. **Escolha nomes claros e descritivos**
* O nome da função deve dizer o que ela faz.

✅ 2. **Uma função = uma responsabilidade**
* Evite funções que fazem várias coisas ao mesmo tempo (conhecido como code smell de "função god").

✅ 3. **Evite efeitos colaterais desnecessários**
* Sempre que possível, prefira funções puras (que não modificam nada fora delas).

* Exceção: funções que têm o propósito de interagir com o usuário, como print().

✅ 4. **Use parâmetros com tipos claros**
* Dart é fortemente tipado, então use isso a seu favor pra ter mais segurança e evitar bugs.

// Melhor que "dynamic" ou sem tipo
```dart 
String converterParaHexadecimal(int numero) { ... }
```
✅ 6. **Use return com cuidado**
* Sempre retorne valores quando a função precisar fornecer resultado.

* Use void para funções que apenas executam ações, como prints ou atualizações de tela.

## Posso chamar minha função dentro dela mesma? 

Pode sim, chamar uma função detro dela, isso se chama `recução`
Exemplo:
```Dart
int fatorial(int n) {
  if (n <= 1) return 1; // caso base
  return n * fatorial(n - 1); // chamada recursiva
}

void main() {
  print(fatorial(5)); // 5 * 4 * 3 * 2 * 1 = 120
}
```
⚠️ Cuidados ao usar recursão:
Cuidado	Por quê?
⚠️ Ter um caso base claro Evita chamadas infinitas (e erro de stack overflow).
⚠️ Testar com entradas pequenas	Funções recursivas podem ser mais lentas e consumir muita memória.
⚠️ Preferir iterativo se possível	Em alguns casos, um  `for` ou `while` é mais eficiente e fácil de ler.

## Existe limite de parâmetros a serem recebidos em uma função? 

**Na prática**:
Não há um limite rígido de parâmetros em uma função ou seja, o compilador não vai te impedir de usar muitos. Mas existe um limite de bom senso.

**Por que evitar muitos parâmetros?**
Mesmo que Dart permita muitos, funções com muitos parâmetros:

• Ficam difíceis de ler
• São mais fáceis de usar errado
• Complicam testes e manutenção

**Quando passar muitos dados, use uma classe ou mapa nomeado**

Exemplo com parâmetros nomeados:
```dart
void criarUsuario({required String nome, required int idade, String? email}) {
  print("Nome: $nome, Idade: $idade, Email: ${email ?? 'não informado'}");
}
```
**Chamada**:

```dart
criarUsuario(nome: "Ana", idade: 25, email: "ana@email.com");
```

Exemplo com objeto como parâmetro:
```dart
class Usuario {
  String nome;
  int idade;
  String email;

  Usuario(this.nome, this.idade, this.email);
}

void salvarUsuario(Usuario usuario) {
  print("Salvando ${usuario.nome}");
}
```

## É recomendado usar de dynamic nos parâmetros de uma função?
 

⚠️ Evite usar dynamic nos parâmetros de funções — a menos que realmente precise!

Usar dynamic desativa a verificação de tipo em tempo de compilação, o que:

❌ Permite passar qualquer coisa (strings, números, objetos, etc.)

❌ Torna o código mais propenso a erros em runtime

❌ Complica a leitura e manutenção (ninguém sabe o que a função espera)

❌ Quebra o autocompletar do editor/IDE

Prefira sempre tipos explícitos e fortes:

```dart
// Bom:
int somar(int a, int b) => a + b;
```

❌ Exemplo perigoso com dynamic:
```dart
dynamic somar(dynamic a, dynamic b) => a + b;

void main() {
  print(somar(5, "10")); // ERRO em tempo de execução!
}
```
🛠 Quando dynamic pode ser útil:

• Funções genéricas que lidam com múltiplos tipos de propósito

• APIs que recebem JSONs dinâmicos

**Quando você vai verificar o tipo dentro da função**:

```dart
void processar(dynamic valor) {
  if (valor is int) {
    print("Número: $valor");
  } else if (valor is String) {
    print("Texto: $valor");
  }
}
```

🔁 Alternativas melhores:
Use Object? se quiser aceitar qualquer tipo, mas sem desativar completamente o sistema de tipos

Use generics (<T>) quando possível

## Quando usar os operadores de valores opcionais e valores requeridos em uma função dart? 

Parâmetros Posicionais Opcionais ([])
Use quando a ordem importa, mas o valor é opcional.

```dart

void saudacao([String? nome]) {
  print("Olá, ${nome ?? 'visitante'}");
}

saudacao(); // Olá, visitante
saudacao("Ana"); // Olá, Ana
```

✅ Quando usar:

• Quando a função aceita argumentos em ordem

• E esses argumentos podem ser omitidos

**Parâmetros Nomeados ({})**

Use quando quer deixar claro qual valor está sendo passado, sem depender da ordem.

```dart
void criarConta({required String usuario, required String senha, bool administrador = false}) {
  print("Usuário: $usuario, Admin: $administrador");
}
```

✅ Quando usar:

• Quando a função tem muitos parâmetros

• Quando você quer facilitar a leitura e evitar confusão com a ordem

```dart

criarConta(usuario: "joao", senha: "1234", administrador: true);
```

## O que são parâmetros nomeados em uma função? 

São parâmetros que você especifica pelo nome na chamada da função, em vez de depender da ordem.

📌 Parâmetros nomeados são colocados entre chaves {} na definição da função.
✅ Exemplo:
```dart
void apresentarPessoa({required String nome, int idade = 18}) {
  print("Nome: $nome, Idade: $idade");
}
```
 Chamada da função:

```dart
apresentarPessoa(nome: "Ana", idade: 25);
apresentarPessoa(nome: "Carlos"); // idade usa valor padrão: 18
```
**Use nomeados quando:**

• A função tiver muitos parâmetros

• Alguns forem opcionais

• Quiser que o código fique mais explicativo

## Quais métodos existem para variáveis do tipo Function em dart?

Variáveis do tipo Function representam funções que podem ser chamadas dinamicamente. Apesar de Function ser um tipo, ele não tem muitos métodos diretamente acessíveis.

**O que você pode fazer com variáveis do tipo Function?**

 **Chamar a função**

É o uso mais direto e comum:
```dart
Function saudacao = () => print("Olá!");
saudacao(); // Executa a função
```
**Verificar o tipo da função**
Você pode verificar se a variável é uma função com is:

```dart
if (minhaFuncao is Function) {
  print("É uma função!");
}
```

**Usar runtimeType**
Verifica a assinatura da função em tempo de execução:

```dart
void digaOi() => print("Oi!");
print(digaOi.runtimeType); // () => void
```

**Passar como parâmetro**
Funções podem ser passadas como argumentos:

```dart
void executar(Function func) {
  func();
}

void ola() => print("Olá!");
executar(ola);
``` 
**Atribuir funções com tipos mais específicos**
Melhor que usar Function genérico, é tipar corretamente:

```dart

int somar(int a, int b) => a + b;

int Function(int, int) operacao = somar;
print(operacao(3, 4)); // 7
```
Isso melhora o autocompletar e a verificação de tipos.

**Funções anônimas e lambda**
Você pode criar funções diretamente em variáveis:

```dart
var dobro = (int x) => x * 2;
print(dobro(4)); // 8
```

## Qual a diferença entre chamar minha função chamado olaMundo das seguintes formas “olaMundo” e “olaMundo()”. 

**Diferença entre `olaMundo` e `olaMundo()`**

**Resumo:**
Sintaxe     Significado                             Exemplo de uso

olaMundo	Referência da função (sem executar)	    var f = olaMundo; f();
olaMundo()	Chamada da função (executa na hora)	    olaMundo();

`olaMundo` → referência da função

• Aqui você está pegando a função, sem executá-la.
```dart
void olaMundo() {
  print("Olá, mundo!");
}

void main() {
  var func = olaMundo; // apenas referência
  func(); // agora sim executa
}
```
`olaMundo()` → chamada da função


• Aqui você está chamando/executando a função imediatamente.
```dart
void olaMundo() {
  print("Olá, mundo!");
}

void main() {
  olaMundo(); // imprime "Olá, mundo!"
}
```