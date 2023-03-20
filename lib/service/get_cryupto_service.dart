import 'package:cryuptoapp/model/model.dart';
import 'package:dio/dio.dart';

class CryuptoService {
  Future<dynamic> getCryupto() async {
    try {
      Response response = await Dio(BaseOptions(
        validateStatus: (statusCode) {
          if (statusCode! >= 199 && statusCode <= 599) {
            return true;
          } else {
            return false;
          }
        },
      )).get("https://nbu.uz/uz/exchange-rates/json/");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CryuptoModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
