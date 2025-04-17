## O que acontece se eu comparar valores de tipos diferentes usando operadores relacionais em dart?

 • Comparar valores de tipos diferentes usando operadores relacionais como `>`, `<`, `>=`, `<=`, geralmente vai obter um erro em tempo de execução.

**Exemplo errado** 
 ```dart
 void main(){
    var numero = 10;
    var texto = "10";

    print(numero > texto);
 }
 ```

 **Exemplo correto**
 ```dart
 void main(){
    var numero = 10;
    var texto = "15";

    var convertido - int.tryParce(texto) ?? 0;
print(numero < convertido);
 }
```

## Qual a diferença entre os operadores de divisão `/` e `~/?`

**`/`Divisão normal (retorna `double`)**
 • Sempre retorna um numero com ponto flutuante (`double`), mesmo que a divisão seja exata.

 **Exemplo**
 ```dart
 print(10 / 2); //5.0 -> tipo double
 print(7 / 2); //3.5
```
**`~/` Divisão inteira (retorna `int`)**


## Como verifico se uma variável é de um determinado tipo em dart? 

 • Pode verificar o tipo de uma variável usando o operador is. Ele retorna true se a variável for do tipo especificado e false caso contrário.
**`is` – verifica se é do tipo**
 ```dart
 var x= 10
 
 print(x is int); //true
 print(x is String); //false
```

**`is!`- verifica se não é do tipo**
```dart
var x = "Ale";

print(nome is! int); //true
print(nome is String); //true
```
## Qual a função do operador `?` em testes de tipo? 

 • Não é um operador de teste de tipo em si, mas um modificador do tipo, dizendo:

"Essa variável pode ser do tipo X, ou pode ser null."

EXEMPLOS

```dart
int? numero;      //pode ser um int ou null
String? nome;     //pode ser uma String ou null
List<int>? lista  //pode ser uma lista de inteiros ou null
```

## Quando usar os operadores de valores opcionais e valores requeridos em uma função dart? 

1. Parâmetros Requeridos (Obrigatórios)
Usados quando o valor deve ser passado sempre que a função for chamada.

✅ Exemplo:
```dart

void saudacao(String nome) {
  print("Olá, $nome!");
}

saudacao("Lucas"); // Ok
saudacao(); // ❌ ERRO: argumento obrigatório não fornecido
```

🟨 2. Parâmetros Opcionais Nomeados
Você usa {} para indicar que os parâmetros são opcionais nomeados.

✅ Exemplo:

```dart
void saudacaoOpcional({String? nome}) {
  print("Olá, ${nome ?? "visitante"}!");
}

saudacaoOpcional();                 // Olá, visitante!
saudacaoOpcional(nome: "Laura");   // Olá, Laura!
Aqui usamos ? para aceitar null, e ?? para dar um valor padrão.
```

🔒 3. Parâmetros Nomeados Requeridos
Você usa {required Tipo nome} para dizer que o parâmetro precisa ser nomeado e obrigatório.

✅ Exemplo:
```dart
void cadastrarUsuario({required String email, required String senha}) {
  print("Email: $email, Senha: $senha");
}

cadastrarUsuario(email: "a@b.com", senha: "123456"); // Ok
// cadastrarUsuario(); // ❌ ERRO: falta argumento obrigatório
```
## Quais são os operadores de atribuição compostos e como eles funcionam?

• Operadores de atribuição compostos são formas curtas e práticas de fazer operações matemáticas (ou lógicas) e atribuir o resultado à mesma variável.

`+=`	Soma e atribui
`-=`	Subtrai e atribui	
`*=`	Multiplica e atribui	
`/=`	Divide e atribui	
`~/=`	Divisão inteira	
`%=`	Módulo e atribui	
`&=`	E bit a bit

```dart
void main() {
  int x = 10;

  x += 5;   // x = 15
  ```

## Como uso os operadores '&&' e '||' para combinar condições?

• São usados para combinar condições booleanas, ou seja, condições que resultam em `true` ou `false`.

`&&` (E lógico)

 • Retorna true apenas se todas as condições forem verdadeiras.
 
 • Se uma for false, o resultado é false.

**EXEMPLO**
```dart
int idade = 20;
bool temCarteira = true;

if (idade >= 18 && temCarteira) {
    printar("Pode dirigir");
}else{
    print("Nao pode dirigir");

}
```
`||` (OU lógico)
 • Retorna true se pelo menos uma das condições for verdadeira.

 • Só retorna false se todas forem falsas.

**EXEMPLO**:
```dart
bool chuva = false;
bool guardachuva = true;

if (chuva || guardachuva) {
    print("você pode sair");
}else{
    print("Melhor esperar")
}
```

## Qual a diferença entre usar 'if-else' e expressões condicionais? 

1. `if-else` tradicional

Usado para controlar o fluxo do programa. Pode executar blocos de código inteiros.

```dart
int idade = 18;

if (idade >= 18) {
  print("É maior de idade");
} else {
  print("É menor de idade");
}
```
 • Ideal para lógica mais longa ou complexa

 • Mais legível quando há múltiplas condições

2. Expressão condicional (operador ternário `? :`)

Usada para retornar um valor baseado em uma condição, geralmente em uma linha só. 

```dart

int idade = 18;

String resultado = idade >= 18 ? "Maior de idade" : "Menor de idade";
print(resultado);
```

 • Ideal para atribuições rápidas

 • Mais compacta, mas pode ficar difícil de ler se for muito aninhada




