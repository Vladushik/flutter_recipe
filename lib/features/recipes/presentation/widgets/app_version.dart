import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppVersionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAppVersion(),
        builder: (BuildContext context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(snapshot.data!.toString()),
              ],
            ),
          );
        },
      ),
    );
  }

  static const platform = MethodChannel('samples.flutter.dev/app_version');

  Future<String> getAppVersion() async {
    String _appVersion = 'Unknown app version.';

    try {
      final String result = await platform.invokeMethod('getAppVersion');
      _appVersion = 'App version $result';
    } on PlatformException catch (e) {
      _appVersion = "Failed to get app version: '${e.message}'.";
    }

    return _appVersion;
  }
}
