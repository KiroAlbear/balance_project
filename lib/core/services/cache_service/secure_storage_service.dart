import 'package:balance_project/core/services/cache_service/secure_storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static SecureStorageService? _instance;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static SecureStorageService getInstance() {
    return _instance ??= SecureStorageService();
  }

  Future<void> resetTransactionsValues() async {
    await _storage.write(
        key: SecureStorageKeys.beneficiariesAmounts, value: "");
  }

  Future<void> setValue(String key, String? value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String> getValue(String key) async {
    return await _storage.read(key: key) ?? "";
  }

  Future<void> deleteValue(String key) async {
    return await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
