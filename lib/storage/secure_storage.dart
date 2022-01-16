import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

  // Secure storage for encrypted shared prefs on android and keychain on iOS
  static final _storage = new FlutterSecureStorage(
      aOptions: const AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  static Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  static Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }

   static write(String key, String value) async {
     return await _storage.write(key: key, value: value);
  }

}
