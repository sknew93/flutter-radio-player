import 'package:connectivity/connectivity.dart';

String currentPage = 'Radio String';
bool isSearching = false;
bool isSwitched = false;


Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
