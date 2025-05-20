import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/core/utils/api.dart';

class CharactersServices {
  Dio dio = Dio();

  CharactersServices() {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(LogInterceptor(
        request: true, requestBody: true, responseBody: true, error: true));
  }
  int pageNumber = 1;

  Future<List<dynamic>> getCharacterData({bool isMore = false}) async {
    try {
      if (isMore) {
        pageNumber++;
      }
      final response =
          await dio.get('${EndPoints.characters}?page=$pageNumber');
      return response.data[ApiKeys.results];
    } on DioException {
      //! Don't forget to handle this exception
      return [];
    }
  }
}
