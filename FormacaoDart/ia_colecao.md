## Que práticas posso adotar para trazer uma melhor performance ao usar listas em dart? 

**Tipagem Explícita:**
• Ajuda a prevenir erros de tipo e torna o código mais fácil de entender.
Exemplo: `List<String> nomes = ['Ana', 'Carlos', 'Maria'];`

**Imutabilidade Quando Necessário:**
• Proteja suas listas contra modificações indesejadas usando `List.unmodifiable()`, que cria uma cópia imutável
Exemplo: `final listaImutavel = List.unmodifiable(minhaLista);`

## Que práticas posso adotar para trazer uma melhor performance ao usar listas em dart? 

**Métodos de Lista de Forma Eficiente:**
• O Dart oferece uma variedade de métodos para manipular listas de forma eficiente.
Exemplos: `map`, `where`, `fold`

**Listas Grandes:**
• Ao trabalhar com listas muito grandes, Use `Iterable` para evitar carregar todos os dados na memória de uma vez.


## O que não é recomendado fazer quando usado listas em dart?

**Modificações durante itera a lista:**
• Modificar listas durante a iteração torna o código mais complexo e difícil de entender, o que dificulta a 
depuração e a manutenção, Tambem pode dar erro durante iteração.

**Uso Excessivo de `insert` e `removeAt`:**
• Os métodos `insert` e `removeAt` podem ser ineficientes em listas grandes, pois exigem o deslocamento de 
todos os elementos após o índice modificado.


## Como entender quando usar listas e quando usar mapas? 

 **Listas:**
Uso:
* A ordem em que os itens são adicionados é preservada.
* Podem ser acessados por seu índice numerico.
* Para armazenar sequências de itens onde a ordem é importante

**Mapas:**
* São coleções de pares chave-valor
* Cada chave ocorre apenas uma vez, mas você pode usar o mesmo valor várias vezes
* A ordem dos itens não é importante.
* Quando você precisar associar chaves a valores e acessar valores rapidamente por uma chave.

## Práticas interessantes no uso de mapas. 

* Escolha `Map<String, Tipo>` = Melhor Legibilidade e Manutenção, Melhor Desempenho. 
* Declare os tipos das chaves e dos valores do mapa explicitamente
Exemplo: `Map<String, int> idades = {'Alejandra': 23, 'Igor': 21};`
* Const: Para mapas conhecidos em tempo de compilação 
`const Map<String, double> precos = {'arroz': 5.50, 'feijão': 8.00};`

## Quais métodos podem me auxiliar no uso de listas e sets em dart? 

**Sets**
`add()`: Adiciona um item
`remove()`: Remove um item.
`contains()`: Verifica se o item está presente no set.
`intersection`(): Retorna um novo Set contendo apenas os elementos que existem nos dois sets.


**Listas**
`add()`: Adiciona um item.
`remove()`: Remove um item.
`length`:  Retorna o número de elementos presentes.
`contains()`: Verificar se um elemento está presente
`sublist()`: Extrai uma parte de uma lista com base em um intervalo da original.
`clear()`: Remove um item específico de uma lista.

## Cuidados ao usar Sets

• Unicidade dos Elementos:
Não permite elementos duplicados. Se você tentar adicionar um elemento que já existe no conjunto, a operação será ignorada.

• Ordem dos Elementos:
Os conjuntos não garantem a ordem dos elementos.

• Iteração:
Pode iterar sobre os elementos de um conjunto usando um loop no método `forEach`.

## Documentação do método elementAtOrNull

`elementAtOrNull` fornece uma maneira segura de acessar um elemento em um índice específico de uma lista, retornando null se o índice 
estiver fora dos limites da lista.

```dart
import 'package:collection/collection.dart';

void main() {
  List<int> numeros = [1, 2, 3];

  print(numeros.elementAtOrNull(1)); // Saída: 2
  print(numeros.elementAtOrNull(5)); // Saída: null
}
