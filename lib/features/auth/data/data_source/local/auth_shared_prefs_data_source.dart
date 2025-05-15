import 'package:ecommerce/core/resources/shared_prefs_manager.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefsDataSource implements AuthLocalDataSource {
  final SharedPreferences _prefs;

  const AuthSharedPrefsDataSource(this._prefs);
  @override
  Future<String> getToken() async {
    final String token = _prefs.getString(SharedPrefsManager.token) ?? '';
    return token;
  }

  @override
  Future<void> saveToken(String token) async {
    _prefs.setString(SharedPrefsManager.token, token);
  }
}
