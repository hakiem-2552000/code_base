import 'package:shared_preferences/shared_preferences.dart';

import 'data_storage_type.dart';

abstract class ISharePreferenceService {
  Future<String> getAccessToken();

  Future setRegisterResponse(String token, bool registerViaApp);

  Future<bool> getRegisterViaApp();

  Future clearDataStorage([DataStorageType? dataStorageType]);
}

class SharePreferenceService extends ISharePreferenceService {
  static Future _storageData({
    required String key,
    required dynamic value,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      return await prefs.setBool(key, value);
    }
    if (value is String) {
      return await prefs.setString(key, value);
    }
  }

  static Future<String> _getDataStorage({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  @override
  Future clearDataStorage([DataStorageType? dataStorageType]) async {
    if (dataStorageType != null) {
      _storageData(key: dataStorageType.path, value: '');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    }
  }

  @override
  Future<String> getAccessToken() async {
    return _getDataStorage(key: DataStorageType.accessToken.path);
  }

  @override
  Future setRegisterResponse(String token, bool registerViaApp) async {
    return Future.wait([
      _storageData(key: DataStorageType.accessToken.path, value: token),
      _storageData(
          key: DataStorageType.registerViaApp.path, value: registerViaApp),
    ]);
  }

  @override
  Future<bool> getRegisterViaApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(DataStorageType.registerViaApp.path) ?? false;
  }
}
