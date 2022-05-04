import 'package:connectivity/connectivity.dart';

abstract class NetworkInfor {
  Future<bool> isConnected();
}

class NetworkInforImplement implements NetworkInfor {
  final Connectivity _connectivity = Connectivity();

  @override
  Future<bool> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
