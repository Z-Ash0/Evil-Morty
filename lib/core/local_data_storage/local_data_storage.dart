abstract class LocalDataStorage<T> {
  Future<void> init();
  Future<void> addAll(List<T> items);
  List<T> getAll();
  Future<void> clear();
}
