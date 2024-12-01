
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tramp_flutter/storage.dart';

class FormRequest extends StatefulWidget {
  const FormRequest({super.key});

  @override
  State<FormRequest> createState() => _FormRequestState();
}

class _FormRequestState extends State<FormRequest> {
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
        title: Text("Vehicle Form Request"),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
              "https://tramp.lzrk.host/form-request/${box.read('userId')}"),
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
