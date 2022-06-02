import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3177787840677082/8289828991";
    } else {
      throw UnsupportedError("Unsupported Platform");
    }
  }
}
