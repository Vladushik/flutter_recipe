import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppVersionPage extends StatefulWidget {
  const AppVersionPage({Key? key}) : super(key: key);

  @override
  _AppVersionPageState createState() => _AppVersionPageState();
}

class _AppVersionPageState extends State<AppVersionPage> {
  @override
  void initState() {
    getAppVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(_textAppVersion),
          ],
        ),
      ),
    );
  }

  String _textAppVersion = 'Unknown battery level.';
  static const platform = MethodChannel('samples.flutter.dev/app_version');

  Future<void> getAppVersion() async {
    String _appVersion = 'Unknown app version.';

    try {
      final String result = await platform.invokeMethod('getAppVersion');
      _appVersion = 'App version $result';
    } on PlatformException catch (e) {
      _appVersion = "Failed to get app version: '${e.message}'.";
    }

    setState(() {
      _textAppVersion = _appVersion;
    });
  }
}
