import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/core/bloc_observer.dart';
import 'package:rick_and_morty_app/core/local_data_storage/hive_adapters_register.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';
import 'package:rick_and_morty_app/core/responsive/size_provider.dart';
import 'package:rick_and_morty_app/core/routes/app_routes.dart';
import 'package:rick_and_morty_app/core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  HiveAdapterRegister.registerAll();
  await registerServices();
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => RickAndMortyApp(appRouter: AppRoutes()),
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key, required this.appRouter});
  final AppRoutes appRouter;

  @override
  Widget build(BuildContext context) {
    return SizeProvider(
      baseSize: const Size(360, 490),
      width: context.screenWidth,
      height: context.screenHeight,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoutes,
      ),
    );
  }
}
