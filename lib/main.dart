// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WebViewTest());
  }
}

class WebViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('Press me'),
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) {
                  return FadeTransition(
                      opacity: animation1, child: ContainOpenWebview());
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ContainOpenWebview extends StatefulWidget {
  @override
  _ContainOpenWebviewState createState() => _ContainOpenWebviewState();
}

class _ContainOpenWebviewState extends State<ContainOpenWebview> {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  double lineProgress = 0.0;

  void initState() {
    super.initState();
    flutterWebviewPlugin.onProgressChanged.listen((progress) {
      // print(progress);
      setState(() {
        lineProgress = progress;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        toolbarHeight: 6,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          child: _progressBar(lineProgress, context),
          preferredSize: Size.fromHeight(3.0),
        ),
      ),
      url: 'https://accion-popular.herokuapp.com/welcome',
    );
  }

  _progressBar(double progress, BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.white70.withOpacity(0),
      value: progress == 1.0 ? 0 : progress,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
    );
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }
}


//Test de pull
// Te quiero Baby UwU 

