// Automatic FlutterFlow imports
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future onAppBackground() async {
  // Add your function code here!
  WidgetsBinding.instance.addObserver(AppLifecycleObserver());
}

class AppLifecycleObserver with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Do something when app is resumed
      print('App is in foreground');
    } else if (state == AppLifecycleState.paused) {
      // Do something when app is paused
      print('App is in background');
    }
  }
}
