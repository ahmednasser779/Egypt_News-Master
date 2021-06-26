import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';

class WebView extends StatelessWidget {
  final String url;
  WebView({@required this.url});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebviewScaffold(
        url: url,
        withJavascript: true,
        withZoom: true,
      ),
    );
  }
}
