import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FormularioPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  bool _inativo = false;

  // Dados salvos
  String? _nomeSalvo;
  int? _idadeSalva;
  bool _inativoSalvo = false;

  // Validação do campo Nome
  String? _validarNome(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nome não pode ser vazio';
    }
    if (value.trim().length < 3) {
      return 'Nome precisa ter pelo menos 3 letras';
    }
    if (!RegExp(r'^[A-Z]').hasMatch(value.trim())) {
      return 'Nome deve começar com letra maiúscula';
    }
    return null;
  }

  // Validação do campo Idade
  String? _validarIdade(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Idade não pode ser vazia';
    }
    final idade = int.tryParse(value);
    if (idade == null) {
      return 'Idade deve ser um número válido';
    }
    if (idade < 18) {
      return 'Idade deve ser maior ou igual a 18';
    }
    return null;
  }

  void _salvarFormulario() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _nomeSalvo = _nomeController.text.trim();
        _idadeSalva = int.parse(_idadeController.text.trim());
        _inativoSalvo = _inativo;
      });
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _idadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário com Validação')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                    validator: _validarNome,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _idadeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Idade',
                      border: OutlineInputBorder(),
                    ),
                    validator: _validarIdade,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: _inativo,
                        onChanged: (value) {
                          setState(() {
                            _inativo = value ?? false;
                          });
                        },
                      ),
                      const Text('Inativo'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _salvarFormulario,
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            if (_nomeSalvo != null && _idadeSalva != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _inativoSalvo ? Colors.grey[300] : Colors.green[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nome: $_nomeSalvo', style: const TextStyle(fontSize: 16)),
                    Text('Idade: $_idadeSalva', style: const TextStyle(fontSize: 16)),
                    Text('Status: ${_inativoSalvo ? "Inativo" : "Ativo"}',
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
