import 'package:flutter/material.dart';
import 'package:lista_contato/shared/text_label.dart';

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({super.key});

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {

  bool salvando = false;

  var nomeController = TextEditingController(text: "");
  var telefoneController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Novo Contato"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: salvando
          ? const Center(child: CircularProgressIndicator())
            : ListView(
              children: [
                const TextLabel(texto: "Nome"),
                TextField(
                  controller: nomeController,
                ),

                const TextLabel(texto: "Telefone"),
                TextField(
                  controller: telefoneController,
                ),

                const TextLabel(texto: "Email"),
                TextField(
                  controller: emailController,
                ),

                TextButton(
                  onPressed: () async {

                  } , 
                  child: Text("Salvar"),
                )

              ],
            ),
        ),
      ),
    );
  }
}
