```
/// The main function of the app.
Future<void> main() async {
  /// Initialize Sentry with the specified DSN and release.
  await SentryFlutter.init(
    (options) {
      options.dsn = sentryDsn;
      options.release = "1.0.0+1";
    },
    /// Run the app after Sentry initialization.
    appRunner: () => runApp(MyApp()),
  );
}

/// The main widget of the app.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Get the device information.
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;

    /// Set the status bar color.
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);

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
            /// Display a text.
            Text('Hello, world!'),

            /// Create a gesture detector with a blue container.
            SizedBox.square(
              dimension: 100,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  /// Log an event to Firebase Analytics.
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