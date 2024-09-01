```
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stacked/stacked.dart';

final sentryDsn =
    'https://47e192f0dba647c3b16a97e9da636927@o557668.ingest.sentry.io/5735578';
final FirebaseAnalytics analytics = FirebaseAnalytics();

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = sentryDsn;
      options.release = "1.0.0+1";
    },
    appRunner: () => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    return MaterialApp(
      title: 'Stacked Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stacked Demo'),
        ),
        body: Column(
          children: <Widget>[
            Text('Hello, world!'),
            SizedBox.square(
              dimension: 100,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  analytics.logEvent(name: 'button_tapped');
                },
                child: Container(
                  color: Colors.blue.shade100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```