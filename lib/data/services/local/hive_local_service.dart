
import 'package:hive_flutter/hive_flutter.dart';

class HiveLocalService {
  HiveLocalService(this._box);
  final Box _box;

  Future<void> saveState() async {
    await _box.put('login', true);
  }

  bool get getData{
      try {
        bool data = _box.get('login');
      return data;
      } catch (e) {
        return false;
      } 
  }
  Future<int> clearCache() => _box.clear();
}