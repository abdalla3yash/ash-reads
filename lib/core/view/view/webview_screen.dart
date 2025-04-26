// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({super.key,required this.title,required this.url});
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) => setState(() => loadingPercentage = 0),
        onProgress: (progress) => setState(() => loadingPercentage = progress),
        onPageFinished: (url) => setState(() => loadingPercentage = 100),
      ))..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),centerTitle: true,),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: controller),
            if (loadingPercentage < 100) LinearProgressIndicator(value: loadingPercentage / 100.0),
          ],
        ),
      ),
    );
  }
}
