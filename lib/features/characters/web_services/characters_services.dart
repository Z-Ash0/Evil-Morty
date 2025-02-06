import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/core/utils/api.dart';

class CharactersServices {
  Dio dio = Dio();

  CharactersServices() {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(LogInterceptor(
        request: true, requestBody: true, responseBody: true, error: true));
  }

  Future<List<dynamic>> getCharacterData() async {
    try {
      final response = await dio.get(EndPoints.characters);
      return response.data[Api.results];
    } on DioException {
      //! Don't forget to handle this exception
      return [];
    }
  }
}
