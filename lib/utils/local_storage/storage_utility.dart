import 'package:get_storage/get_storage.dart';

class YLocalStorage {
  static final YLocalStorage _instance = YLocalStorage._internal();

  factory YLocalStorage() {
    return _instance;
  }

  YLocalStorage._internal();

  final _storage = GetStorage();

  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAllData() async {
    await _storage.erase();
  }
}
