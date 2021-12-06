import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  @override
  void initState() {
    super.initState();
    contatos.add(Contato(
        nome: "Nimeman", telefone: "96536-6531", tipo: ContatoType.trabalho));
    contatos.add(
        Contato(nome: "Seife", telefone: "94968-8284", tipo: ContatoType.casa));
    contatos.add(Contato(
        nome: "Hiensi", telefone: "99381-1752", tipo: ContatoType.trabalho));
    contatos.add(Contato(
        nome: "Lieguis", telefone: "97166-3557", tipo: ContatoType.casa));
    contatos.add(Contato(
        nome: "Ciuho", telefone: "99370-5335", tipo: ContatoType.celular));
    contatos.add(Contato(
        nome: "Muceo", telefone: "95746-3734", tipo: ContatoType.celular));
    contatos.add(Contato(
        nome: "Taire", telefone: "96915-3472", tipo: ContatoType.trabalho));
    contatos.add(Contato(
        nome: "Zinui", telefone: "91895-3719", tipo: ContatoType.celular));
    contatos.add(Contato(
        nome: "Lyuwu", telefone: "96362-0328", tipo: ContatoType.favorito));
    contatos.add(Contato(
        nome: "Blace", telefone: "99681-4748", tipo: ContatoType.trabalho));
    contatos.add(Contato(
        nome: "Higoy", telefone: "99943-8882", tipo: ContatoType.favorito));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              var contato = contatos[index];
              return ListTile(
                leading: CircleAvatar(
                  child: ContatoHelper.getIconByContatoType(contato.tipo),
                  backgroundColor: Colors.blue[200],
                ),
                title: Text(contato.nome),
                subtitle: Text(contato.telefone),
                trailing: IconButton(
                    icon: const Icon(Icons.call), onPressed: () => {}),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: contatos.length));
  }
}

class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({required this.nome, required this.telefone, required this.tipo});
}

enum ContatoType { celular, trabalho, favorito, casa }

class ContatoHelper {
  static Icon getIconByContatoType(ContatoType tipo) {
    switch (tipo) {
      case ContatoType.celular:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContatoType.trabalho:
        return Icon(Icons.work, color: Colors.brown[600]);
      case ContatoType.favorito:
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContatoType.casa:
        return Icon(Icons.home, color: Colors.purple[600]);
    }
  }
}
