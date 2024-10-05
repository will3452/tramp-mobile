import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tramp_flutter/page/login.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRAMP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TRAMP'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InAppWebViewController? webViewController;
  late InAppWebViewGroupOptions options;

  @override
  void initState() {
    super.initState();
    options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        javaScriptEnabled: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.start),
        tooltip: "Get started!",
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri("https://tramp.lzrk.host/mobile-landing"),
        ),
        initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
          javaScriptEnabled: true,
          supportZoom: false,
        )),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
