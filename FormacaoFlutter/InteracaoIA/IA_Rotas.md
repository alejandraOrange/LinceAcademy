## ROTAS ANÔNIMAS
 O que são rotas anônimas e como funcionam?
Rotas anônimas são aquelas que você cria dinamicamente usando o widget da tela de destino diretamente com Navigator.push().

```dart
Copiar
Editar
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => TelaDetalhes()),
);
```

## Quais métodos do Navigator são comumente usados e por quê?

Método	Função
`Navigator.push`	Navega para uma nova tela.
`Navigator.pop`	Volta para a tela anterior.
`Navigator.pushReplacement`	Substitui a tela atual pela nova (não permite voltar).
`Navigator.pushAndRemoveUntil`	Navega e remove todas as rotas anteriores.

## Qual a função do Navigator.push() na navegação com rotas anônimas?
Adiciona uma nova tela (rota) na pilha de navegação. É usado para "ir" para outra tela sem definir nomes.

## Vantagens e desvantagens das rotas anônimas
• Vantagens:

Simples de usar.

Boa para projetos pequenos.

• Desvantagens:

Reutilização difícil.

Organização ruim em projetos grandes.

Não separa lógica da navegação.

## ROTAS NOMEADAS
 O que são rotas nomeadas e como funcionam?
São identificadas por strings únicas registradas no MaterialApp.

```dart
Copiar
Editar
routes: {
  '/home': (context) => TelaHome(),
  '/detalhes': (context) => TelaDetalhes(),
}
```

Navegação:

```dart
Copiar
Editar
Navigator.pushNamed(context, '/detalhes');
```

## Como navegar para uma rota nomeada específica?
```dart
Navigator.pushNamed(context, '/perfil');
```
Com argumentos:

```dart
Navigator.pushNamed(context, '/perfil', arguments: 'João');
```

## Vantagens das rotas nomeadas
• Organização centralizada.
• Mais legível e escalável.
• Ideal para aplicativos com muitas telas.

❌ Mais configuração.
❌ Argumentos precisam de cuidados para tipagem correta.


## Como definir rotas nomeadas
No MaterialApp:

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => TelaInicial(),
    '/detalhes': (context) => TelaDetalhes(),
  },
)
```

## Como acessar os parâmetros passados em uma rota nomeada?
```dart
final argumentos = 
ModalRoute.of(context)!.settings.arguments as String;
```

## Como tornar os parâmetros opcionais em uma rota nomeada?
Use dynamic e verifique:

```dart
final args = ModalRoute.of(context)!.settings.arguments;
if (args != null && args is MeuObjeto) {
  // usar args
}
```
## CUIDADOS E BOAS PRÁTICAS COM ROTAS

• Cuidados:
Evite acoplamento forte entre telas.

Sempre verifique o tipo dos argumentos.

Use Navigator.pop(context, resultado) para retornar dados com segurança.

• Boas práticas:
Use rotas nomeadas para projetos médios e grandes.

Agrupe rotas em um arquivo separado.

Crie um RouteGenerator para tratar rotas dinamicamente:

```dart
onGenerateRoute: (settings) {
  switch (settings.name) {
    case '/detalhes':
      final data = settings.arguments as MeuObjeto;
      return MaterialPageRoute(builder: (_) => TelaDetalhes(data));
  }
}
```
Use GoRouter ou auto_route em projetos complexos para facilitar ainda mais a navegação.