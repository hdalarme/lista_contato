class ContactsModel {
  List<Results> results = [];

  ContactsModel(this.results);

  ContactsModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }
}

class Results {
  String objectId = "";
  String nome = "";
  String foto = "";
  String telefone = "";
  String email = "";
  String createdAt = "";
  String updatedAt = "";

  Results(this.objectId, this.nome, this.foto, this.telefone, this.email,
      this.createdAt, this.updatedAt);

  Results.criar(
    this.nome,
    this.telefone,
    this.email,
  );

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nome = json['nome'];
    foto = json['foto'];
    telefone = json['telefone'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['nome'] = nome;
    data['foto'] = foto;
    data['telefone'] = telefone;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['foto'] = foto;
    data['telefone'] = telefone;
    data['email'] = email;
    return data;
  }
}
