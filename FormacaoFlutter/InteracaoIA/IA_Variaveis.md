## Boas práticas ao declarar variáveis em Dart

Usar var, final, ou const quando possível, evitando tipos explícitos redundantes:

```dart
var nome = 'Ana';        // OK
String nome = 'Ana';     // OK, mas redundante
Use nomes descritivos e em camelCase:
```
```dart
var temperaturaAtual = 25.0;
```
Prefira final se o valor não será alterado, e const se for conhecido em tempo de compilação.

Evitar variáveis globais. Prefira escopos reduzidos e bem delimitados.

# O que evitar ao declarar variáveis
Evitar nomes genéricos como x, temp, data sem contexto.

Não inicializar variáveis desnecessariamente como null, especialmente se for evitável.

Evitar o uso excessivo de dynamic, pois perde-se segurança de tipos.

Não usar late sem necessidade real — pode ocultar erros de inicialização.

# Cuidados com valores nulos
Dart tem null safety: se uma variável pode ser null, você precisa declarar explicitamente com ?.

```dart
String? nome;  // Pode ser null
```
Evite acessar variáveis potencialmente nulas sem verificar:

```dart
print(nome.length); // ERRO: se nome for null
print(nome?.length); // OK
```

# Quando usar late vs variáveis nulas (?)
Caso	Use late	Use tipo nulo (?)
A variável será inicializada depois, mas você garante que não será null	✅	❌
A variável pode ser null logicamente	❌	✅

Exemplo:

```dart
late String nomeCompleto; // Você garante que irá atribuir depois
String? apelido;      // Pode ser null de fato
```

# Benefícios do late
Evita nulos acidentais.

Adia a inicialização de uma variável que não pode ser null.

Útil para injeção de dependência, variáveis de teste, ou inicialização tardia.

Exemplo:

```dart
class Usuario {
  late String nome;
  void carregar() {
    nome = 'Carlos'; // Atribuição posterior, mas garantida
  }
}
```

# Diferença entre final e const
Característica	final	const
Avaliação	Em tempo de execução	Em tempo de compilação
Mutabilidade	Valor imutável	Valor imutável
Exemplos válidos	final agora = DateTime.now();	const pi = 3.1415;
 
# Por que usar final e const?
Clareza: Expressa intenção de imutabilidade.

Performance: O compilador pode otimizar const.

Segurança: Evita modificações acidentais no valor.

# Principais métodos de String em Dart
length, isEmpty, isNotEmpty

`toUpperCase()`, `toLowerCase()`

`contains()`, `startsWith()`, `endsWith()`

`substring()`, `replaceAll()`, `split()`

`trim()`, `padLeft()`, `padRight()`

`codeUnits`, `runes`, `codeUnitAt()`

compareTo()

Exemplo:

```dart
var texto = "Dart";
print(texto.toUpperCase()); // DART
print(texto.contains("ar")); // true
```

# Principais métodos de inteiros (int) em Dart
`isEven`, `isOdd`

`abs()`, `sign`

`toDouble()`, `toString()`

`compareTo()`

`clamp(min, max)`

`bitLength`, `toRadixString(base)`

`remainder()`, `round()`, `floor()`, `ceil()`

Exemplo:

```dart
int numero = -10;
print(numero.abs());           // 10
print(numero.isEven);         // true
print(numero.toRadixString(2)); // '1010'
```