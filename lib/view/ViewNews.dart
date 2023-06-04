import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewNews extends StatelessWidget {
  final newsUrl;

  const ViewNews({Key? key, this.newsUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(newsUrl));
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("News")),
      body: Container(child: WebViewWidget(
       controller: controller,
       )),
    );
  }
}
