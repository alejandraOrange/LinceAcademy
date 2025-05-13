## 1. O que é o MaterialApp e seus parâmetros?

É o widget principal que configura toda a estrutura visual de um aplicativo Flutter com base no Material Design (um padrão visual do Google).

Principais parâmetros do MaterialApp:
title: Título do aplicativo (usado, por exemplo, em tarefas do sistema).

home: Define o widget inicial da aplicação (geralmente uma tela).

theme: Define o tema visual da aplicação (cores, fontes, etc).

routes: Define rotas nomeadas para navegação entre telas.

initialRoute: Rota que será carregada ao iniciar o app (substitui home).

debugShowCheckedModeBanner: Remove a faixa "DEBUG" no topo.

##  2. Como funcionam os imports no Flutter?
Os imports permitem trazer bibliotecas ou arquivos para o código. Exemplos:

```dart
import 'package:flutter/material.dart'; // Importa widgets do Material Design
import 'meu_arquivo.dart';              // Importa um arquivo local
```
`package`: importa pacotes da pasta `pubspec.yaml`.

`import` com caminho relativo importa arquivos do projeto local.

## 3. O que é o Material Design e como ele é utilizado no Flutter?
Material Design é um padrão de design criado pelo Google, com foco em UI/UX moderna, responsiva e consistente.

No Flutter, ele é implementado com o pacote material.dart e widgets como Scaffold, AppBar, FloatingActionButton, entre outros. Usando MaterialApp, o Flutter já aplica esse padrão visual automaticamente.

## 4. Principais widgets do Material Design no Flutter:
`Scaffold`: Estrutura básica com app bar, body, drawer, etc.

`AppBar`: Barra superior da tela.

`TextField`: Campo de texto.

`ElevatedButton`: Botão com elevação.

`FloatingActionButton`: Botão flutuante.

`Drawer`: Menu lateral.

`SnackBar`: Notificação na parte inferior.

`Card`, `ListTile`, `BottomNavigationBar`, etc.

## 5. O que são widgets Stateless e quando usá-los?

Widgets Stateless não mantêm estado interno. Eles são ideais quando o conteúdo não muda depois de construído.

Exemplo de uso:

Layouts fixos

Textos, ícones, imagens que não mudam

```dart
class MeuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Olá!');
  }
}
```

## 6. Ciclo de vida de um widget Stateless
Simples e direto:

Widget é criado.

O método `build()` é chamado para montar a UI.

O widget só será reconstruído se um pai o recriar com novas informações.

## 7. Limitações dos widgets Stateless
Não podem armazenar ou reagir a mudanças de estado interno.

Para mudanças dinâmicas (contador, animação, carregamento), eles são insuficientes.

## 8. O que são widgets `Stateful` e quando usá-los?
Widgets Stateful têm estado interno mutável. Devem ser usados quando:

Há interações do usuário.

Dados mudam durante a execução.

Elementos dinâmicos (ex: contador, formulário).

```dart
class MeuWidget extends StatefulWidget {
  @override
  _MeuWidgetState createState() => _MeuWidgetState();
}

class _MeuWidgetState extends State<MeuWidget> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Text('$contador');
  }
}
```

## 9. Ciclo de vida de um widget Stateful

`createState()` = cria o estado.

`initState()` = inicialização (ex: buscar dados).

`build()` = monta a interface.

`setState()` = atualiza o estado e reconstrói o widget.

`dispose()` = limpeza (ex: fechar streams, controllers).

## 10. Como é feito o gerenciamento de estado em StatefulWidget?
Por padrão, usa-se o método setState() para atualizar o estado:

```dart
setState(() {
  contador++;
});
```

Isso reconstrói apenas o widget necessário, mantendo desempenho.

## 11. Como funciona o `setState()` em Flutter?
setState() informa ao Flutter que algo mudou no estado interno e que o widget precisa ser reconstruído.

Importante:

Só afeta o widget onde foi chamado.

Evitar lógica pesada dentro do setState.

## 12. Cuidados no gerenciamento de estado:

Evitar múltiplas chamadas de setState desnecessárias.

Limpar recursos no dispose().

Manter lógica de negócios fora da UI, se possível (usar Provider, Riverpod, Bloc etc. para projetos maiores).

Evitar estado em excesso dentro do widget — prefira separar lógica.

## 13. Diferenças principais entre Stateless e Stateful
| **Aspecto**           | **Stateless Widget**          | **Stateful Widget**                             |
| --------------------- | ----------------------------- | ----------------------------------------------- |
| **Armazena estado?**  | Não                         | Sim Sim                                           |
| **Reage a mudanças?** | Não                         | Sim Sim                                           |
| **Uso ideal**         | Layouts fixos, estáticos      | Interfaces dinâmicas e interativas              |
| **Complexidade**      | Simples, direto               | Mais complexo, exige controle do ciclo de vida  |
| **Exemplo típico**    | Texto, ícone, imagem estática | Contadores, formulários, abas (tabs), animações |

