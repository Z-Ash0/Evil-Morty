import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/core/local_data_storage/local_data_storage.dart';

class HiveService<T> implements LocalDataStorage<T> {
  final String boxName;
  late Box<T> _box;

  HiveService({required this.boxName});

  @override
  Future<void> init() async {
    if (!Hive.isBoxOpen(boxName)) {
      _box = await Hive.openBox<T>(boxName);
    }
    _box = Hive.box<T>(boxName);
  }

  @override
  Future<void> addAll(List<T> items) async => await _box.addAll(items);

  @override
  List<T> getAll() => _box.values.toList();

  @override
  Future<void> clear() async => _box.clear();
}
