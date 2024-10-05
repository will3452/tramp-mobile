import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tramp_flutter/page/form-request.dart';
import 'package:tramp_flutter/page/home.dart';
import 'package:tramp_flutter/page/login.dart';
import 'package:tramp_flutter/permissions.dart';
import 'package:tramp_flutter/storage.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  InAppWebViewController? webViewController;
  late InAppWebViewGroupOptions options;

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
    options = InAppWebViewGroupOptions(
      android: AndroidInAppWebViewOptions(
        geolocationEnabled: true,
      ),
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
        title: Text("Maps"),
      ),
      body: InAppWebView(
        onGeolocationPermissionsShowPrompt: (controller, origin) async {
          return GeolocationPermissionShowPromptResponse(
              origin: origin, allow: true, retain: true);
        },
        initialUrlRequest: URLRequest(
          url: WebUri("https://tramp.lzrk.host/default-map"),
        ),
        initialOptions: options,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: 1,
      //     onTap: (value) => {
      //           if (value == 0)
      //             {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => HomePage()),
      //               )
      //             }
      //         },
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: "Home",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.file_present),
      //         label: "Trips",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.map),
      //         label: "Map",
      //       ),
      //       // BottomNavigationBarItem(
      //       //   icon: Icon(Icons.abc),
      //       //   label: "Message",
      //       // ),
      //       // BottomNavigationBarItem(
      //       //   icon: Icon(Icons.verified_user),
      //       //   label: "Profile",
      //       // ),
      //     ]),
    );
  }
}

class HomeMenu extends StatelessWidget {
  final String assetImage;
  final dynamic page;
  final String label;
  const HomeMenu({
    super.key,
    required this.assetImage,
    required this.page,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        child: Column(
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: Image.asset(
                assetImage,
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
            Text("$label"),
          ],
        ));
  }
}
