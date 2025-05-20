import 'package:rick_and_morty_app/core/networking/dio_consumer.dart';
import 'package:rick_and_morty_app/core/utils/api_const.dart';

class CharactersServices {
  final DioConsumer dio;
  CharactersServices({required this.dio});

  int pageNumber = 1;

  Future<List<dynamic>> getCharacterData({bool isMore = false}) async {
    if (isMore) {
      pageNumber++;
    }
    final response = await dio.get(
      path: '${EndPoints.characters}?page=$pageNumber',
    );
    return response.data[ApiKeys.results];
  }
}
