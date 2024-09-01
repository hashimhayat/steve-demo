main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name to Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Name to Image'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  var _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _imageUrl = await _generateImage(_nameController.text);
                  setState(() {});
                }
              },
              child: Text('Generate Image'),
            ),
            if (_imageUrl != null) Image.network(_imageUrl),
          ],
        ),
      ),
    );
  }

  Future<String> _generateImage(String name) async {
    var res = await http.get(Uri.parse('https://api.generated.photos/faces'));
    var data = jsonDecode(res.body);
    return data['faces'][0]['url'];
  }
}