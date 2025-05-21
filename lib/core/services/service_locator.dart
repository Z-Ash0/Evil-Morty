import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/networking/dio_consumer.dart';
import 'package:rick_and_morty_app/core/services/local_data_storage.dart';
import 'package:rick_and_morty_app/features/characters/data/repository/characters_repository_impl.dart';
import 'package:rick_and_morty_app/features/characters/data/data_sources/characters_remote_data_src.dart';
import 'package:rick_and_morty_app/features/characters/domain/repos/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/presentation/manager/characters_cubit/characters_cubit.dart';

final getIt = GetIt.instance;

Future<void> registerServices() async {
  getIt.registerSingleton<DioConsumer>(DioConsumer(Dio()));

  getIt.registerSingleton<CharactersRemoteDataSrc>(
      CharactersRemoteDataSrcImpl(dio: getIt<DioConsumer>()));

  getIt.registerSingleton<CharactersRepository>(
      CharactersRepositoryImpl(getIt<CharactersRemoteDataSrc>()));

  getIt.registerSingleton<CharactersCubit>(
      CharactersCubit(getIt<CharactersRepository>()));

  getIt.registerSingleton<LocalDataStorage>(HiveService());
  await getIt<HiveService>().init();
}
