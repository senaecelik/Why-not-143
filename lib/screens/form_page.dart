import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);
  InAppWebViewController controller;
  String url = "https://forms.gle/oCr7bv8Q37A56Kua6";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: progress < 1.0
                ? LinearProgressIndicator(value: progress)
                : Container(),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.all(10.0),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.amberAccent)),
            child: InAppWebView(
              initialUrl: url,
              initialHeaders: {},
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(debuggingEnabled: True)),
              onWebViewCreated: (InAppWebViewController) =>
                  controller = WebViewController,
              onLoadStart: (controller, url) {
                setState(() {
                  this.url = url;
                });
              },
              onLoadStop: (controller, url) {
                setState(() {
                  this.url = url;
                });
              },
              onProgressChanged: (controller, progress) {
                SetState(() {
                  this.progress = progress / 100;
                });
              },
            ),
          ))
        ],
      ))),
    );
  }
}
