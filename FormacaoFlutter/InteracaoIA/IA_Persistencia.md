## O que é persistência de dados em aplicativos Flutter e por que é importante?
É a capacidade de salvar dados localmente no dispositivo, de forma que permaneçam disponíveis mesmo após fechar o app. Isso é essencial para:

• Lembrar preferências do usuário.

• Manter o login.

• Salvar progresso, temas, etc.

## 2. Quais tipos de dados podem ser persistidos em Flutter?
| Tipo de dado  | Exemplos                             | Ferramentas comuns             |
| ------------- | ------------------------------------ | ------------------------------ |
| **Simples**   | Strings, números, bool, preferências | `SharedPreferences`            |
| **Complexos** | Listas, objetos, modelos JSON        | `Hive`, `Sqflite`, `ObjectBox` |
| **Arquivos**  | Imagens, PDFs, documentos            | `path_provider`, `dart:io`     |

## 3. O que é o pacote SharedPreferences e como ele funciona?
É uma biblioteca que permite salvar pares chave-valor de forma persistente no armazenamento local (em disco). Ideal para:

Tema escuro/claro.

Login automático.

Lembrar se o usuário já viu o onboarding.

```dart

final prefs = await SharedPreferences.getInstance();
await prefs.setBool('isDarkMode', true);
```

## 4. Quais são as limitações do SharedPreferences?
Armazena apenas tipos primitivos: int, double, bool, String, List<String>.

Não é criptografado (use com cuidado para dados sensíveis).

Não é indicado para armazenar grandes volumes de dados ou listas complexas.

## 5. Quando usar SharedPreferences em vez de outras opções?
Use SharedPreferences quando:

Os dados forem simples e leves.

Não for necessário pesquisar, ordenar ou consultar relações.

Você não precisa de criptografia nem de muita performance.

Para dados mais estruturados, prefira Hive, Isar ou Sqflite.

## 6. Como lidar com erros ao usar SharedPreferences?
Envolva chamadas em try-catch:

```dart
try {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isFirstRun', false);
} catch (e) {
  print('Erro ao salvar preferências: $e');
}
```

## 7. Melhores práticas com SharedPreferences
Centralize a lógica de leitura/gravação em uma classe de serviço (preferences_service.dart).

Evite acessar diretamente do UI.

Leia os dados antes de carregar a UI principal (ex: no Splash).

Remova chaves antigas se não forem mais usadas.

Não abuse do número de chaves (limpeza e organização são importantes).

