Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      Sentry.captureException(details.exception, stackTrace: details.stack);
    };
    await SentryFlutter.init(
      (options) {
        options.dsn = sentryDsn;
        options.release = "1.0.0+1";
      },
      appRunner: () => runApp(MyApp()),
    );
  }, (error, stackTrace) {
    Sentry.captureException(error, stackTrace: stackTrace);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stacked Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return Scaffold(
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
    );
  }
}