import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => EstadoListaDePessoas(),
      child: MyApp(),
    ),
  );
}

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

String tipoToString(TipoSanguineo tipo) {
  switch (tipo) {
    case TipoSanguineo.aPositivo:
      return "A+";
    case TipoSanguineo.aNegativo:
      return "A-";
    case TipoSanguineo.bPositivo:
      return "B+";
    case TipoSanguineo.bNegativo:
      return "B-";
    case TipoSanguineo.oPositivo:
      return "O+";
    case TipoSanguineo.oNegativo:
      return "O-";
    case TipoSanguineo.abPositivo:
      return "AB+";
    case TipoSanguineo.abNegativo:
      return "AB-";
  }
}

Color corPorTipo(TipoSanguineo tipo) {
  switch (tipo) {
    case TipoSanguineo.aPositivo:
      return Colors.blue;
    case TipoSanguineo.aNegativo:
      return Colors.red;
    case TipoSanguineo.bPositivo:
      return Colors.purple;
    case TipoSanguineo.bNegativo:
      return Colors.orange;
    case TipoSanguineo.oPositivo:
      return Colors.green;
    case TipoSanguineo.oNegativo:
      return Colors.yellow;
    case TipoSanguineo.abPositivo:
      return Colors.cyan;
    case TipoSanguineo.abNegativo:
      return Colors.white;
  }
}

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final TipoSanguineo tipoSanguineo;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pessoa &&
          runtimeType == other.runtimeType &&
          email == other.email;

  @override
  int get hashCode => email.hashCode;
}

class EstadoListaDePessoas with ChangeNotifier {
  final List<Pessoa> _lista = [];

  List<Pessoa> get pessoas => List.unmodifiable(_lista);

  void incluir(Pessoa p) {
    _lista.add(p);
    notifyListeners();
  }

  void excluir(Pessoa p) {
    _lista.remove(p);
    notifyListeners();
  }

  void editar(Pessoa antigo, Pessoa novo) {
    final index = _lista.indexOf(antigo);
    if (index != -1) {
      _lista[index] = novo;
      notifyListeners();
    }
  }

  List<Pessoa> filtrar(TipoSanguineo? tipo) {
    if (tipo == null) return pessoas;
    return _lista.where((p) => p.tipoSanguineo == tipo).toList();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => TelaInicial(),
        '/listar': (_) => TelaListagem(),
        '/formulario': (_) => TelaFormulario(),
      },
    );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Início")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/listar'),
              child: Text("Listar Pessoas"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/formulario'),
              child: Text("Adicionar Pessoa"),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaListagem extends StatefulWidget {
  @override
  State<TelaListagem> createState() => _TelaListagemState();
}

class _TelaListagemState extends State<TelaListagem> {
  TipoSanguineo? filtro;

  @override
  Widget build(BuildContext context) {
    final estado = context.watch<EstadoListaDePessoas>();
    final pessoas = estado.filtrar(filtro);

    return Scaffold(
      appBar: AppBar(title: Text("Lista de Pessoas")),
      body: Column(
        children: [
          DropdownButton<TipoSanguineo?>(
            hint: Text("Filtrar por tipo"),
            value: filtro,
            items: [
              DropdownMenuItem(value: null, child: Text("Todos")),
              ...TipoSanguineo.values.map(
                (e) => DropdownMenuItem(value: e, child: Text(tipoToString(e))),
              ),
            ],
            onChanged: (value) => setState(() => filtro = value),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pessoas.length,
              itemBuilder: (_, i) {
                final p = pessoas[i];
                return Card(
                  color: corPorTipo(p.tipoSanguineo),
                  child: ListTile(
                    title: Text(p.nome),
                    subtitle: Text(
                      "Email: ${p.email}\nTelefone: ${p.telefone}\nTipo: ${tipoToString(p.tipoSanguineo)}",
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => estado.excluir(p),
                    ),
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TelaFormulario(pessoaOriginal: p),
                          ),
                        ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TelaFormulario extends StatefulWidget {
  final Pessoa? pessoaOriginal;

  const TelaFormulario({this.pessoaOriginal});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final _formKey = GlobalKey<FormState>();
  late String nome, email, telefone;
  TipoSanguineo? tipo;

  @override
  void initState() {
    super.initState();
    if (widget.pessoaOriginal != null) {
      nome = widget.pessoaOriginal!.nome;
      email = widget.pessoaOriginal!.email;
      telefone = widget.pessoaOriginal!.telefone;
      tipo = widget.pessoaOriginal!.tipoSanguineo;
    } else {
      nome = email = telefone = '';
      tipo = null;
    }
  }

  void salvar() {
    if (_formKey.currentState!.validate() && tipo != null) {
      _formKey.currentState!.save();
      final pessoa = Pessoa(
        nome: nome,
        email: email,
        telefone: telefone,
        tipoSanguineo: tipo!,
      );
      final estado = context.read<EstadoListaDePessoas>();
      if (widget.pessoaOriginal != null) {
        estado.editar(widget.pessoaOriginal!, pessoa);
      } else {
        estado.incluir(pessoa);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Pessoa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: nome,
                decoration: InputDecoration(labelText: "Nome"),
                validator:
                    (v) => v == null || v.isEmpty ? "Informe o nome" : null,
                onSaved: (v) => nome = v!,
              ),
              TextFormField(
                initialValue: email,
                decoration: InputDecoration(labelText: "Email"),
                validator:
                    (v) => v == null || v.isEmpty ? "Informe o email" : null,
                onSaved: (v) => email = v!,
              ),
              TextFormField(
                initialValue: telefone,
                decoration: InputDecoration(labelText: "Telefone"),
                validator:
                    (v) => v == null || v.isEmpty ? "Informe o telefone" : null,
                onSaved: (v) => telefone = v!,
              ),
              DropdownButtonFormField<TipoSanguineo>(
                value: tipo,
                items:
                    TipoSanguineo.values.map((t) {
                      return DropdownMenuItem(
                        value: t,
                        child: Text(tipoToString(t)),
                      );
                    }).toList(),
                decoration: InputDecoration(labelText: "Tipo Sanguíneo"),
                onChanged: (v) => setState(() => tipo = v),
                validator: (v) => v == null ? "Selecione um tipo" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: salvar, child: Text("Salvar")),
            ],
          ),
        ),
      ),
    );
  }
}
