import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contato Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ContatoModel contato = ContatoModel();

  var child;

  get _formKey => null;

  get updateNome => null;

  get updateTelefone => null;

  get updateEmail => null;

  get updateCpf => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contato.nome),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 20,
            runSpacing: 10,
            children: <Widget>[
              TextFormField(
                validator: nomeValidator(),
                onChanged: updateNome,
                decoration: const InputDecoration(labelText: "Nome"),
                maxLength: 100,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  telefoneInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                onChanged: updateTelefone,
                decoration: const InputDecoration(labelText: "Celular"),
              ),
              TextFormField(
                validator: emailValidator(),
                onChanged: updateEmail,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  cpfInputFormatter(),
                ],
                onChanged: updateCpf,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "CPF"),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print(contato);
                    }
                  },
                  child: const Text('Salvar'))
            ],
          ),
        ),
      ),
    );
  }
}

void updateCpf(cpf) => contato.cpf = cpf;

void updateEmail(email) => contato.email = email;

void updateTelefone(telefone) => contato.telefone = telefone;

void updateNome(nome) {
  setState(() {
    contato.nome = nome;
  });
}

TextFieldValidator emailValidator({required String errorText}) {
  return emailValidator(errorText: 'e-mail inválido');
}

FieldValidator nomeValidator() {
  return MultiValidator(
    [
      RequiredValidator(errorText: 'campo obrigatório'),
      MinLengthValidator(4, errorText: 'tamanho mínimo de 4 caracteres'),
    ],
  );
}

class ContatoModel {
  late String nome;
  late String email;
  late String cpf;
  late String telefone;
  late ContatoType tipo;
}

enum ContatoType { celular, trabalho, favorito, casa }
