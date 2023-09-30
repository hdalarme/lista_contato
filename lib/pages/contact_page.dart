import 'package:flutter/material.dart';
import 'package:lista_contato/model/contact_model.dart';
import 'package:lista_contato/model/repositories/contact_repository.dart';
import 'package:lista_contato/pages/contact_form_page.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  ContactRepository repository = ContactRepository();
  ContactsModel contactModel = ContactsModel([]);
  var carregando = false;

  @override
  void initState() {
    super.initState();
    obterContato();
  }

  void obterContato() async {
    setState(() {
      carregando = true;
    });
    contactModel = await repository.obterContatos();
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return SafeArea(
      child: Scaffold(

        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.person_add_alt_1_outlined),
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => ContactFormPage()),);
          },
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: contactModel.results.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var contato = contactModel.results[index];
                    return Dismissible(
                      key: Key(contato.nome),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey), // Cor da borda
                          borderRadius: const BorderRadius.all(
                              Radius.circular(8)), // Borda arredondada
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3AUser_icon-cp.svg&psig=AOvVaw2HapEwQ4vbZQNWiSxaMACw&ust=1696185399782000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCIi62J790oEDFQAAAAAdAAAAABAE"),
                              radius: 50,
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contato.nome,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  contato.telefone,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  contato.email,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      /*ListTile(
                        title: Text(contato.nome),
                        subtitle: Text(contato.telefone),
                      )*/
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
