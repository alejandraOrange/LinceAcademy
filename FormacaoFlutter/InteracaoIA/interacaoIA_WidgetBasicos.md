 1. O que é o widget Row em Flutter?
Row é um widget que organiza filhos na horizontal (em linha).

dart
Copiar
Editar
Row(
  children: [
    Icon(Icons.star),
    Text('Favorito'),
  ],
)
↔️ 2. Como adicionar espaçamento uniforme entre os widgets em um Row?
Usando SizedBox:

dart
Copiar
Editar
Row(
  children: [
    Icon(Icons.star),
    SizedBox(width: 10),
    Text('Favorito'),
  ],
)
Ou usando MainAxisAlignment.spaceBetween ou spaceEvenly:

dart
Copiar
Editar
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [Icon(Icons.star), Text('Favorito')],
)
🔁 3. Diferença entre MainAxisAlignment e CrossAxisAlignment em um Row:
MainAxisAlignment: controla o alinhamento horizontal (eixo principal da Row).

CrossAxisAlignment: controla o alinhamento vertical (eixo cruzado da Row).

Exemplo:

dart
Copiar
Editar
Row(
  mainAxisAlignment: MainAxisAlignment.center,   // centro na horizontal
  crossAxisAlignment: CrossAxisAlignment.start,  // alinhado ao topo
  children: [...]
)
🧱 4. O que é o widget Column em Flutter?
Column organiza widgets na vertical (em coluna).

dart
Copiar
Editar
Column(
  children: [
    Text('Título'),
    Text('Subtítulo'),
  ],
)
🔁 5. Diferença entre MainAxisAlignment e CrossAxisAlignment em uma Column:
MainAxisAlignment: controla o alinhamento vertical (eixo principal da Column).

CrossAxisAlignment: controla o alinhamento horizontal (eixo cruzado da Column).

🧊 6. O que é o widget Stack em Flutter?
Stack sobrepõe widgets, permitindo posicionamento livre em camadas, como em um "pilha" de cartas.

dart
Copiar
Editar
Stack(
  children: [
    Image.asset('fundo.jpg'),
    Positioned(top: 10, left: 10, child: Text('Título')),
  ],
)
✅ 7. Vantagens de usar Stack em vez de Row ou Column:
Permite sobreposição de widgets.

Útil para elementos flutuantes, como botões sobre imagens, badges, etc.

Permite posicionamento absoluto com Positioned.

📌 8. Como posicionar widgets específicos dentro de um Stack?
Use o widget Positioned:

dart
Copiar
Editar
Stack(
  children: [
    Container(color: Colors.blue, width: 100, height: 100),
    Positioned(
      top: 10,
      right: 10,
      child: Icon(Icons.star),
    ),
  ],
)
🖼️ 9. Como exibir uma imagem de um arquivo local em Flutter?
Adicione a imagem em assets/.

Configure no pubspec.yaml:

yaml
Copiar
Editar
flutter:
  assets:
    - assets/minha_imagem.png
Use:

dart
Copiar
Editar
Image.asset('assets/minha_imagem.png')
🔤 10. Quais propriedades controlam a aparência do texto (fonte, tamanho, cor)?
Use TextStyle:

dart
Copiar
Editar
Text(
  'Olá!',
  style: TextStyle(
    fontSize: 20,
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  ),
)
📄 11. Como exibir um texto em várias linhas?
Por padrão, Text quebra linhas automaticamente. Para mais controle:

dart
Copiar
Editar
Text(
  'Texto muito longo...',
  maxLines: 3,
  overflow: TextOverflow.ellipsis,
)
📜 12. Como criar uma lista com rolagem vertical em Flutter?
Use ListView:

dart
Copiar
Editar
ListView(
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
➕ 13. Como adicionar itens dinamicamente a um ListView?
Use ListView.builder com uma lista de dados:

```dart

ListView.builder(
  itemCount: lista.length,
  itemBuilder: (context, index) {
    return Text(lista[index]);
  },
)
```

# 14. Diferenças entre ListView.builder e ListView.separated:

Característica	ListView.builder	ListView.separated
Itens com separador	Não	Sim (permite separadores entre itens)
Método extra	—	separatorBuilder

```dart

ListView.separated(
  itemCount: lista.length,
  itemBuilder: (_, i) => Text(lista[i]),
  separatorBuilder: (_, i) => Divider(),
)
```

# 15. Como usar ListTile para criar itens em um ListView?
```dart
ListView(
  children: [
    ListTile(
      leading: Icon(Icons.person),
      title: Text('João'),
      subtitle: Text('Desenvolvedor'),
      trailing: Icon(Icons.arrow_forward),
    ),
  ],
)
```

# 16. Como tornar itens ListTile interativos (clicáveis)?
Use o parâmetro onTap:

```dart
ListTile(
  title: Text('Clique aqui'),
  onTap: () {
    print('Item clicado!');
  },
)
```
# 17. Vantagens de usar ListTile em vez de widgets simples:
Organização padronizada: leading, title, subtitle, trailing.

Melhor layout responsivo para listas.

Interações fáceis com onTap, onLongPress.

Ideal para listas complexas sem criar muito layout manual.

