import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = 'prefsKeyLang';
const String prefsKeyVerificationEmail = 'prefsKeyVerificationEmail';
const String prefsKeyId = 'prefsKeyId';
const String prefsKeyToken = 'prefsKeyToken';
const String prefsKeyOnBoarding = 'onBoarding';

class CacheHelper {
  final SharedPreferences _sharedPreferences;
  CacheHelper(this._sharedPreferences);

  Future<void> saveLogin(bool isThereUser) async {
    _sharedPreferences.setBool(prefsKeyVerificationEmail, isThereUser);
  }

  Future<bool?> getLogin() async {
    bool? isThereUser = _sharedPreferences.getBool(
      prefsKeyVerificationEmail,
    );
    return isThereUser;
  }

  Future<void> saveId(String Id) async {
    _sharedPreferences.setString(prefsKeyId, Id);
  }

  Future<void> deleteId(String Id) async {
    _sharedPreferences.remove(prefsKeyId);
  }

  Future<String?> getId() async {
    String? Id = _sharedPreferences.getString(prefsKeyId);
    return Id;
  }
  // Future<void> savePhone(String phone) async {
  //   _sharedPreferences.setString(prefsKeyPhone, phone);
  // }

  // Future<String?> getPhone() async {
  //   String? phone = _sharedPreferences.getString(prefsKeyPhone);
  //   return phone;
  // }

  // Future<void> saveToken(String token) async {
  //   _sharedPreferences.setString(prefsKeyToken, token);
  // }

  // Future<String?> getToken() async {
  //   String? token = _sharedPreferences.getString(prefsKeyToken);
  //   return token;
  // }

  // Future<void> saveOnBoarding(bool isTrue) async {
  //   _sharedPreferences.setBool(prefsKeyOnBoarding, isTrue);
  // }

  // Future<bool?> getOnBoarding() async {
  //   bool? onboarding = _sharedPreferences.getBool(prefsKeyOnBoarding);
  //   return onboarding;
}
