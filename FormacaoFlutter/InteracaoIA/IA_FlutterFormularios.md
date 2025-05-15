
## 1. O que é um widget TextField e para que serve?
É um campo de entrada de texto. Permite ao usuário digitar dados como nome, email, número etc.

## 2. Como obter o valor digitado pelo usuário?
Você usa um TextEditingController:

```dart

final controller = TextEditingController();

TextField(
  controller: controller,
),

// Depois:
print(controller.text);
```

## 3. Diferença entre TextField e TextFormField
TextField	TextFormField
Simples, direto	Usado em formulários
Sem validação automática	Permite validações via validator
Não depende de um Form	Depende de um Form para validação


## 4. Parâmetros importantes do TextField
controller: para acessar/modificar texto.

decoration: para rótulo, borda, ícone etc.

keyboardType: tipo de teclado (número, email...).

maxLength: limita número de caracteres.

obscureText: esconde texto (como senha).

onChanged: dispara ao digitar.

enabled: ativa ou desativa o campo.


## 5. O que significa validar um campo de texto em Flutter?
Verificar se o valor inserido é aceitável (ex: email válido, campo obrigatório preenchido). Normalmente feito com TextFormField + Form.

## 6. Diferença entre validação síncrona e assíncrona
Tipo	O que é	Exemplo
Síncrona	Valida imediatamente	if (value.isEmpty)
Assíncrona	Envolve espera/processo externo	Verificar email já cadastrado em servidor


## CheckBox em Flutter
O que é e para que serve?
É um botão de seleção booleana (ligado/desligado). Serve para confirmar ações (ex: aceitar termos, marcar opções).


## 8. Como alterar cor e forma de um CheckBox
```dart
Checkbox(
  value: true,
  onChanged: (bool? newValue) {},
  activeColor: Colors.green, // cor quando marcado
  checkColor: Colors.white,  // cor do check
  shape: RoundedRectangleBorder( // forma
    borderRadius: BorderRadius.circular(5),
  ),
)
```


## Radio em Flutter
 9. O que é e para que serve?
Permite selecionar uma única opção dentro de um grupo (ex: gênero, forma de pagamento). Útil quando há múltiplas escolhas, mas apenas uma deve ser selecionada.


 ## 10. Como alterar cor e forma de um Radio
```dart
Radio<int>(
  value: 1,
  groupValue: selectedValue,
  onChanged: (int? value) {},
  activeColor: Colors.red,
  fillColor: MaterialStateProperty.all(Colors.orange),
  visualDensity: VisualDensity.compact,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
)
```