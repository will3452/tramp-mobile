import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tramp_flutter/page/form-request.dart';
import 'package:tramp_flutter/page/home.dart';
import 'package:tramp_flutter/page/login.dart';
import 'package:tramp_flutter/storage.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
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
        title: Text("Calendar"),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
              "https://tramp.lzrk.host/schedule/${box.read('userId')}?type=${box.read('userType')}"),
        ),
        initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
          javaScriptEnabled: true,
          supportZoom: false,
        )),
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
