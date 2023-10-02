import 'package:dio/dio.dart';
import 'package:lista_contato/model/contact_model.dart';

class ContactRepository {
  var dio = Dio();
  var url = "https://parseapi.back4app.com/classes";

  Future<ContactsModel> obterContatos() async {
    dio.options.headers["X-Parse-Application-Id"] =
        "9ujBkjabA760sMo32wnNkbPGMRch3vkWdTlrwDtV";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "4pFXvhCxbC3voKGlbc3WXiD2eNQWTVvWuhHSMDW1";
    dio.options.headers["content-Type"] = "application/json";
    var result = await dio.get("$url/contacts");

    return ContactsModel.fromJson(result.data);
  }

  Future<void> criar(Results contact) async {
    dio.options.headers["X-Parse-Application-Id"] =
        "9ujBkjabA760sMo32wnNkbPGMRch3vkWdTlrwDtV";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "4pFXvhCxbC3voKGlbc3WXiD2eNQWTVvWuhHSMDW1";
    dio.options.headers["content-Type"] = "application/json";

    try {
      await dio.post("$url/contacts", data: contact.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizar(String objectId, Results contact) async {
    dio.options.headers["X-Parse-Application-Id"] =
        "9ujBkjabA760sMo32wnNkbPGMRch3vkWdTlrwDtV";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "4pFXvhCxbC3voKGlbc3WXiD2eNQWTVvWuhHSMDW1";
    dio.options.headers["content-Type"] = "application/json";

    try {
      await dio.put("$url/contacts/$objectId",
          data: contact.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> remover(String objectId) async {
    dio.options.headers["X-Parse-Application-Id"] =
        "9ujBkjabA760sMo32wnNkbPGMRch3vkWdTlrwDtV";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "4pFXvhCxbC3voKGlbc3WXiD2eNQWTVvWuhHSMDW1";
    dio.options.headers["content-Type"] = "application/json";

    try {
      await dio.delete("$url/contacts/$objectId");
    } catch (e) {
      throw e;
    }
  }
}
