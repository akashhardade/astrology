import 'dart:io';

class AdHelper {
  // Production IDs for reference
  // Android:
  // App Id: ca-app-pub-0359328910626404~6464045263
  // Banner Unit Id: ca-app-pub-0359328910626404/8798564561
  // Interstitial Unit Id: ca-app-pub-0359328910626404/1550719225
  //
  // iOS:
  // App Id: ca-app-pub-0359328910626404~2348649783
  // Banner Unit Id: ca-app-pub-0359328910626404/4723677477
  // Interstitial Unit Id: ca-app-pub-0359328910626404/9784432466

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-0359328910626404/8798564561'; // Android ID
    } else if (Platform.isIOS) {
      return 'ca-app-pub-0359328910626404/4723677477'; // iOS ID
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-0359328910626404/1550719225'; // Android ID
    } else if (Platform.isIOS) {
      return 'ca-app-pub-0359328910626404/9784432466'; // iOS ID
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  // static String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-3940256099942544/5224354917'; // Android Test ID
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-3940256099942544/1712485313'; // iOS Test ID
  //   } else {
  //     throw UnsupportedError('Unsupported platform');
  //   }
  // }
}
