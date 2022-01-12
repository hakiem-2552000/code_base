import 'package:flutter/services.dart';

import 'constants/country_code.dart';

class FlavorSettings {
  late final String apiBaseUrl;
  late final String publicKey;
  late final String agoraAppID;
  late final String xSecretKey;
  late final String countryCode;
  late final String testPhone;
  late final String testAccessToken;
  late final String testOTP;
  late final String domain;

  // late final ConfigAdjust configAdjust;
  late final String amplitudeApiKey;

  FlavorSettings.dev() {
    domain = 'http://numbersapi.com';
    apiBaseUrl = 'http://numbersapi.com';
    publicKey = '  ';
    agoraAppID = '  ';
    xSecretKey =
        '51fdfa265d8162cdeca725039bbecdf3df6fec1505d9946a4ad143fb4e01137f';
    countryCode = COUNTRY_CODE_VN;
    testPhone = '+84999999999';
    testAccessToken = 'vequeanhdiemaongoaiocachratxabameanhngayxuacungoday';
    testOTP = '999999';
    // configAdjust = ConfigAdjust.dev();
  }

  FlavorSettings.prod() {
    domain = 'http://numbersapi.com';
    apiBaseUrl = 'http://numbersapi.com';
    publicKey = '  ';
    agoraAppID = '  ';
    xSecretKey =
        '51fdfa265d8162cdeca725039bbecdf3df6fec1505d9946a4ad143fb4e01137f';
    countryCode = COUNTRY_CODE_JP;
    testPhone = '+81999999999';
    testAccessToken = 'vequeanhdiemaongoaiocachratxabameanhngayxuacungoday';
    testOTP = '999999';
    // configAdjust = ConfigAdjust.prod();
  }

  FlavorSettings.stg() {
    domain = 'http://numbersapi.com';
    apiBaseUrl = 'http://numbersapi.com';
    publicKey = '  ';
    agoraAppID = '  ';
    xSecretKey =
        '51fdfa265d8162cdeca725039bbecdf3df6fec1505d9946a4ad143fb4e01137f';
    countryCode = COUNTRY_CODE_JP;
    testPhone = '+81999999999';
    testAccessToken = 'vequeanhdiemaongoaiocachratxabameanhngayxuacungoday';
    testOTP = '999999';
    // configAdjust = ConfigAdjust.stg();
  }
}

Future<FlavorSettings> getFlavorSettings() async {
  String? flavor =
      await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
  if (flavor == 'dev') {
    return FlavorSettings.dev();
  } else if (flavor == 'stg') {
    return FlavorSettings.stg();
  } else if (flavor == 'prod') {
    return FlavorSettings.prod();
  } else {
    throw Exception('Unknown flavor: $flavor');
  }
}
