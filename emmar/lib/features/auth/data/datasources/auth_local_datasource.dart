import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  /// Gets the cached [UserModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<UserModel> getLastUser();

  Future<void> cacheUser(UserModel userToCache);

  Future<bool> hasToken();

  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> clearUser();
}

const CACHED_USER = 'CACHED_USER';
const CACHED_TOKEN = 'CACHED_TOKEN';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserModel> getLastUser() {
    final jsonString = sharedPreferences.getString(CACHED_USER);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUser(UserModel userToCache) {
    return sharedPreferences.setString(
      CACHED_USER,
      json.encode(userToCache.toJson()),
    );
  }

  @override
  Future<bool> hasToken() async {
    return sharedPreferences.containsKey(CACHED_TOKEN);
  }

  @override
  Future<void> saveToken(String token) {
    return sharedPreferences.setString(CACHED_TOKEN, token);
  }

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString(CACHED_TOKEN);
  }

  @override
  Future<void> clearUser() async {
    await sharedPreferences.remove(CACHED_USER);
    await sharedPreferences.remove(CACHED_TOKEN);
  }
}