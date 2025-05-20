import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/networking/dio_consumer.dart';
import 'package:rick_and_morty_app/features/characters/data/repository/characters_repository_impl.dart';
import 'package:rick_and_morty_app/features/characters/data/web_services/characters_services.dart';
import 'package:rick_and_morty_app/features/characters/domain/repos/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/presentation/manager/characters_cubit/characters_cubit.dart';

final getIt = GetIt.instance;

Future<void> registerServices() async {
  getIt.registerSingleton<DioConsumer>(DioConsumer());

  getIt.registerSingleton<CharactersServices>(
      CharactersServices(dio: getIt<DioConsumer>()));

  getIt.registerSingleton<CharactersRepository>(
      CharactersRepositoryImpl(getIt<CharactersServices>()));

  getIt.registerSingleton<CharactersCubit>(
      CharactersCubit(getIt<CharactersRepository>()));
}
