import 'package:flutter/material.dart';
import 'package:lista_contato/model/contact_model.dart';
import 'package:lista_contato/model/repositories/contact_repository.dart';
import 'package:lista_contato/shared/text_label.dart';

class ContactFormPage extends StatefulWidget {
  final Results? contactToEdit;

  //const ContactFormPage({super.key, Results? contactsModel, contactToEdit});
  const ContactFormPage({Key? key, this.contactToEdit}) : super(key: key);

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  ContactRepository repository = ContactRepository();
  ContactsModel contactsModel = ContactsModel([]);

  bool salvando = false;

  var nomeController = TextEditingController(text: "");
  var telefoneController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    if (widget.contactToEdit != null) {
      nomeController.text = widget.contactToEdit!.nome;
      telefoneController.text = widget.contactToEdit!.telefone;
      emailController.text = widget.contactToEdit!.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.contactToEdit != null ? 'Editar Contato' : 'Novo Contato'),
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
                        if (widget.contactToEdit != null) {
                          await repository.atualizar(
                              widget.contactToEdit!.objectId,
                              Results.criar(
                                  nomeController.text,
                                  telefoneController.text,
                                  emailController.text));
                        } else {
                          await repository.criar(Results.criar(
                              nomeController.text,
                              telefoneController.text,
                              emailController.text));
                        }

                        Navigator.pop(context);
                      },
                      child: Text("Salvar"),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
