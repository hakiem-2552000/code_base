enum DataStorageType {
  accessToken,
  registerViaApp,
}

extension DataStorageExtension on DataStorageType {
  String get path {
    switch (this) {
      case DataStorageType.accessToken:
        return 'access_token';
      case DataStorageType.registerViaApp:
        return 'register_via_app';
    }
  }
}
