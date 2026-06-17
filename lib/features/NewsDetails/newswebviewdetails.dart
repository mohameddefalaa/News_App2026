import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewScreen extends StatefulWidget {
  final String url; // هنمرر اللينك من هنا

  const NewsWebViewScreen({super.key, required this.url});

  @override
  State<NewsWebViewScreen> createState() => _NewsWebViewScreenState();
}

class _NewsWebViewScreenState extends State<NewsWebViewScreen> {
  late final WebViewController controller;
  bool isLoading = true; // عشان نبين loading

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // تفعيل JavaScript
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() => isLoading = true); // ابدأ loading
          },
          onPageFinished: (url) {
            setState(() => isLoading = false); // وقف loading
          },
          onWebResourceError: (error) {
            print('Error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url)); // هنا بنحمل اللينك
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        actions: [
          // زرار reload
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => controller.reload(),
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          // شوي loading indicator فوق الـ WebView
          if (isLoading) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
