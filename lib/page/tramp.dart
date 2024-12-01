import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tramp_flutter/storage.dart';

import 'login.dart';

class TrampPage extends StatefulWidget {
  const TrampPage({super.key});

  @override
  State<TrampPage> createState() => _TrampPageState();
}

class _TrampPageState extends State<TrampPage> {
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
    final String userName = box.read('userName');
    final String userEmail = box.read('userEmail');
    final String userType = box.read('userType');
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(76, 175, 80, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                    AssetImage('assets/images/user-account.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$userName ($userType)",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "$userEmail",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // ListTile(
            //   title: const Text("Message"),
            //   leading: Icon(Icons.chat),
            // ),
            ListTile(
              title: const Text("Logout"),
              leading: Icon(Icons.logout),
              onTap: () {
                box.erase();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Tramp"),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
              "https://tramp.lzrk.host/mobile-dashboard/${box.read('userId')}"),
        ),
        initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              javaScriptEnabled: true,
              supportZoom: false,
            )),
      ),
    );
  }
}
