import 'package:rick_and_morty_app/core/networking/dio_consumer.dart';
import 'package:rick_and_morty_app/core/utils/api_const.dart';

abstract class CharactersRemoteDataSrc {
  Future<List<dynamic>> getAllCharacters({required int pageNumber});
}

class CharactersRemoteDataSrcImpl extends CharactersRemoteDataSrc {
  final DioConsumer dio;
  CharactersRemoteDataSrcImpl({required this.dio});

  @override
  Future<List<dynamic>> getAllCharacters({required int pageNumber}) async {
    final response = await dio.get(
      path: '${EndPoints.characters}?page=$pageNumber',
    );
    return response.data[ApiKeys.results];
  }
}
