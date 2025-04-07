# Apontamentos:
Com a ajuda da IA, obtive resultados bons em meu aprendizado. Consegui, otimizar meu código e compreender conceitos que no meu parecer são complexos de forma muito mais rápida e eficiente. A IA complementa as video-aulas do curso, me permitindo entender cada linha de código em detalhes.

# Boas práticas em Dart na declaraçao de variaveis

• Os nomes das variáveis devem ser claros e concisos, refletindo o propósito da variável, ainda mais quando não for claro o objetivo evitando erros no futuro.

• Usar 'var' quando o tipo da variável for óbvio a partir da inicialização (por exemplo, 'var mensagem = "Olá";').

• Evite o uso de dynamic a menos que seja absolutamente necessário, pois ele desativa a verificação de tipo.

• Sempre que possível, inicialize as variáveis no momento da declaração, Isso torna o código mais claro e reduz o risco de erros.

# O que evitar na hora de declarar variaveis em dart

## Uso excessivo de "dynamic":
O tipo "dynamic" desativa a verificação de tipo do Dart, o que pode levar a erros em tempo de execução, Em vez de usar o dado, tente usar tipos específicos sempre que possível como (int, bool, String)

## Não inicializar variáveis:

Sempre inicialize suas variáveis no momento da declaração, se possível, Isso torna o código mais claro e reduz o risco de erros, Quando a inicialização não for possível, utilize a palavra chave "late", para indicar que a variavel será inicializada depois.

# Quais cuidados tomar quando crio variáveis com valor nulo trabalhando com dart? 

## Declare Variáveis Nuláveis Corretamente:

Use o operador ? para indicar que uma variável pode ser nula,
Exemplo: 'String? nome;'
Ao declarar uma variável como nulável, você está informando ao compilador que ela pode conter o valor null.

## Usar o Operador ! com Cautela:

O operador '!' é usado para afirmar que uma variável nulável não é nula, Se usa apenas quando você tiver certeza absoluta de que a variável não será nula em tempo de execução, O uso incorreto do operador ! pode causar erros se a variável for nula.

# Quando usar variáveis nulas e quando usar o modificador late? 
## Quando usar:
• Quando precisar de declarar uma variável não nula, USAR '?';
• Quando a inicialização depende de outros dados que ainda não estão disponíveis no momento da declaração, USAR'late';
• Quando se busca otimizar a utilização de memória, USAR 'late';

## Beneficios do 'late'
• Oferece benefícios significativos em termos de otimização de desempenho.

# Quais as diferenças entre final e const em dart? 
•'final': O valor pode ser definido em tempo de execução.
•'const': O valor deve ser conhecido em tempo de compilação.

# Por que no dart usar variáveis 'final' e 'const' ao invés de usar somente seus valores padrão? 
• Garantem que o valor de uma variável não seja alterado após a inicialização.
• Torna o código mais previsível e fácil de entender, reduzindo a complexidade e a probabilidade de bugs.
• Comunicam claramente a intenção do programador de que um valor não deve ser alterado. Isso torna o código mais fácil de ler e entender, especialmente para outros desenvolvedores.

# Quais métodos possuem as variáveis strings no dart?
'length': Retorna o número de caracteres na string.

'isEmpty': Retorna true se a string estiver vazia e false caso contrário.

'isNotEmpty': Retorna true se a string não estiver vazia e false caso contrário.

'contains'(Pattern other): Retorna true se a string contiver a sequência de caracteres especificada por other.

'startsWith'(Pattern pattern): Retorna true se a string começar com a sequência de caracteres especificada por pattern.

'endsWith'(Pattern pattern): Retorna true se a string terminar com a sequência de caracteres especificada por pattern.

# Traga a documentação dos métodos de variáveis inteiras. 

abs() - Retorna o valor absoluto
ceil() - Arredonda para cima
floor() - Arredonda para baixo
round()	- Arredonda para o inteiro mais próximo
clamp(a, b) - Restringe o valor dentro do intervalo [a, b]
toDouble() - Retorna o valor inteiro como um double.

