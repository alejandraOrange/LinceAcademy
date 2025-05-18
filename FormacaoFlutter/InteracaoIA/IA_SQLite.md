## 1. O que é um banco de dados SQLite e como ele funciona em Flutter?
SQLite é um banco de dados relacional leve que armazena os dados em um único arquivo local. Em Flutter, ele é usado para armazenar dados persistentes no dispositivo, usando pacotes como sqflite.

## 2. Quais são as vantagens de usar SQLite em aplicativos Flutter?
Funciona offline (ideal para apps que não dependem de internet).

Simples de configurar e usar.

Armazena dados estruturados de forma eficiente.

Compatível com operações SQL padrão.

Muito leve e embutido no app (não precisa de servidor).

## 3. Quais são os tipos de dados básicos que posso armazenar em SQLite?
SQLite é fracamente tipado, mas suporta:

INTEGER — números inteiros

REAL — números com ponto flutuante

TEXT — strings

BLOB — dados binários

NULL — valor nulo

## 4. Como posso inserir novos registros em uma tabela SQLite usando Flutter?
Com o pacote sqflite:

```dart

await db.insert(
  'usuarios',
  {'nome': 'Ana', 'idade': 25},
  conflictAlgorithm: ConflictAlgorithm.replace,
);
```

## 5. Como posso inserir vários registros de uma vez em uma tabela SQLite?
Usando uma transação:

```dart
  await db.transaction((txn) async {
  await txn.insert('usuarios', {'nome': 'Carlos', 'idade': 30});
  await txn.insert('usuarios', {'nome': 'Beatriz', 'idade': 28});
});
```

Ou com batch:

```dart

var batch = db.batch();
batch.insert('usuarios', {'nome': 'Lucas', 'idade': 22});
batch.insert('usuarios', {'nome': 'Joana', 'idade': 26});
await batch.commit(noResult: true);
```

## 6. Como posso obter o ID do último registro inserido em uma tabela SQLite?
```dart

int id = await db.insert('usuarios', {'nome': 'Lara', 'idade': 24});
```

O insert retorna o ID automaticamente.

## 7. Como posso filtrar os resultados de uma consulta usando a cláusula WHERE?
```dart

List<Map<String, dynamic>> resultado = await db.query(
  'usuarios',
  where: 'idade > ?',
  whereArgs: [25],
);
```

## 8. Como posso agrupar os resultados de uma consulta usando a cláusula GROUP BY?
```dart
await db.rawQuery('SELECT idade, COUNT(*) FROM usuarios GROUP BY idade');
## 9. Como posso excluir registros de uma tabela SQLite usando Flutter?
```dart
await db.delete(
  'usuarios',
  where: 'idade < ?',
  whereArgs: [18],
);
```

## 10. Quais os cuidados necessários ao usar UPDATE, INSERT e DELETE?
Valide os dados antes de alterar.

Use where para evitar afetar todos os registros por engano.

Use transações para operações críticas.

Faça backups antes de alterações em massa.

Evite SQL Injection usando parâmetros (? e whereArgs).

## 11. Como posso criar tabelas relacionadas em um banco de dados SQLite?
Exemplo com chave estrangeira:

```sql
CREATE TABLE departamentos (
  id INTEGER PRIMARY KEY,
  nome TEXT
);

CREATE TABLE funcionarios (
  id INTEGER PRIMARY KEY,
  nome TEXT,
  departamento_id INTEGER,
  FOREIGN KEY(departamento_id) REFERENCES departamentos(id)
);
```

## 12. Como posso consultar dados de tabelas relacionadas usando JOIN?
```dart
await db.rawQuery('''
  SELECT f.nome, d.nome as departamento
  FROM funcionarios f
  JOIN departamentos d ON f.departamento_id = d.id
''');
```


## 13. O que são transações em um banco de dados SQLite e por que são importantes?
Transações agrupam várias operações em uma única unidade atômica. Se uma falhar, todas são revertidas. Elas garantem:

Consistência dos dados

Segurança contra falhas durante operações complexas


## 14. Como posso reverter uma transação em caso de erro?
O sqflite faz isso automaticamente se lançar uma exceção:

```dart
await db.transaction((txn) async {
  await txn.insert('usuarios', {'nome': 'Erro'});
  throw Exception('Falha!');
  // Tudo acima será revertido
});
```
## 15. Quais são as vantagens de usar transações para garantir a integridade dos dados?
Evita registros parciais ou corrompidos

Garante que todas as etapas sejam concluídas com sucesso

Reverte automaticamente em caso de erro

Protege dados em operações simultâneas