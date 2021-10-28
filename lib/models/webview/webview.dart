import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
class WebViewScreen extends StatefulWidget {
  late String url;
  WebViewScreen({required this.url});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();

}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl:widget.url ,
      ),
    );
  }
}
