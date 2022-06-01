import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:why_not_143_team/meta/widget/custom_circular.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  String url =
      "https://docs.google.com/forms/d/e/1FAIpQLSeqv3sRJt8SW2W2EVgxxvBcwqQLy6JL3DErn87EgtpRvxWDEg/viewform";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: progress < 1.0
                ? LinearProgressIndicator(value: progress)
                : const CustomCircular(),
          ),
          _formDetailBody()
        ],
      )),
    );
  }

  Expanded _formDetailBody() {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
        onWebViewCreated: (inAppWebViewController) =>
            webViewController = webViewController,
        onLoadStart: (controller, url) {
          setState(() {
            this.url = url.toString();
          });
        },
        onLoadStop: (controller, url) {
          setState(() {
            this.url = url.toString();
          });
        },
        onProgressChanged: (controller, progress) {
          setState(() {
            this.progress = progress / 100;
          });
        },
      ),
    ));
  }
}
