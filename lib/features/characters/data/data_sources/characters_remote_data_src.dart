import 'package:rick_and_morty_app/core/networking/dio_consumer.dart';
import 'package:rick_and_morty_app/core/utils/api_const.dart';

abstract class CharactersRemoteDataSrc {
  Future<List<dynamic>> getAllCharacters({bool isMore = false});
}

class CharactersRemoteDataSrcImpl extends CharactersRemoteDataSrc {
  final DioConsumer dio;
  CharactersRemoteDataSrcImpl({required this.dio});

  int pageNumber = 1;

  @override
  Future<List<dynamic>> getAllCharacters({bool isMore = false}) async {
    if (isMore) {
      pageNumber++;
    }
    final response = await dio.get(
      path: '${EndPoints.characters}?page=$pageNumber',
    );
    return response.data[ApiKeys.results];
  }
}
