## 1. O que é gerenciamento de estado em Flutter e por que é importante?
É o controle de dados que mudam com o tempo e precisam ser refletidos na interface (UI). Ex: contadores, listas, autenticação, temas.

Sem um bom gerenciamento de estado, a UI pode se comportar de forma incorreta, inconsistente ou ineficiente.

## 2. Diferença entre estado local e estado global
| Tipo       | Descrição                         | Exemplo                           |
| ---------- | --------------------------------- | --------------------------------- |
| **Local**  | Limitado a um widget.             | Um contador em um botão.          |
| **Global** | Compartilhado entre várias telas. | Login, tema, carrinho de compras. |


## 3. Vantagens de usar gerenciador de estados
Organização do código.

Reutilização e testes mais fáceis.

Atualização eficiente da UI.

Clareza na separação entre UI e lógica.

## 4. O que é o pacote Provider e para que serve?
É um gerenciador de estado leve e eficiente, baseado em InheritedWidgets. Serve para:

Compartilhar dados entre widgets.

Atualizar a UI automaticamente quando o estado mudar.

## 5. Como o Provider evita reconstruções desnecessárias?
Ele só reconstrói os widgets que realmente usam os dados atualizados, graças ao Consumer ou Selector.

## 6. Como o Provider simplifica o gerenciamento de estado?
Remove a necessidade de setState() em toda a árvore.

Permite reatividade automática e desacoplada.

Ajuda a separar UI (Widgets) da lógica (Model/Notifier).

## 7. O que é ChangeNotifierProvider e como funciona?
É o Provider que escuta um objeto (ChangeNotifier) e reconstrói os widgets que o usam quando notifyListeners() é chamado.

## 8. Como fornecer um ChangeNotifier para a árvore?
```dart
ChangeNotifierProvider(
  create: (context) => MeuModelo(),
  child: MeuApp(),
)
```


## 9. Como atualizar o estado usando Provider?
Dentro do seu modelo:

```dart

class MeuModelo extends ChangeNotifier {
  int contador = 0;

  void incrementar() {
    contador++;
    notifyListeners(); // notifica os ouvintes
  }
}
```

E chamar:
```dart
context.read<MeuModelo>().incrementar();
```
## 10. O que é Consumer e como ele funciona?
É um widget que ouve um Provider e reconstrói seu conteúdo sempre que notifyListeners() é chamado.

``` 11. Como o Consumer reconstrói apenas widgets dependentes do estado?
Porque ele envolve apenas parte da UI que usa o estado. Isso evita reconstruções de widgets que não dependem daquele valor.
```
## 12. Como usar o Consumer para acessar o estado?
```dart

Consumer<MeuModelo>(
  builder: (context, modelo, child) {
    return Text('Contador: ${modelo.contador}');
  },
)
```

## 13. Diferença entre Consumer e Provider.of()
| Acesso          | Quando usar                                                                                                                                  |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `Consumer`      | Reativo, reconstrói automaticamente.                                                                                                         |
| `Provider.of()` | Mais direto, mas **pode** reconstruir todo o widget se usado com `listen: true` (default). Use `listen: false` para acesso sem reconstrução. |


## 14. Como otimizar o uso de Consumer?
Evite envolver a árvore inteira com Consumer.

Use o parâmetro child para partes da UI que não dependem do estado:

```dart

Consumer<MeuModelo>(
  builder: (context, modelo, child) {
    return Column(
      children: [
        Text('Contador: ${modelo.contador}'),
        child!, // botão não será reconstruído
      ],
    );
  },
  child: ElevatedButton(
    onPressed: () => context.read<MeuModelo>().incrementar(),
    child: Text('Incrementar'),
  ),
)
```