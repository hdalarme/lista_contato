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
}
