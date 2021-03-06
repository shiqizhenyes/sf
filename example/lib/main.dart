import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sf/sf.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Sf.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    sf.init(context).fit(375, 1440);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Wrap(
          children: <Widget>[
            Container(
              color: Colors.pink,
              width: sf.dp(Dp.$200),
              height: sf.dp(Dp.$200),
            ),
            Container(
              color: Colors.green,
              width: sf.dp(Dp.$175),
              height: sf.dp(Dp.$200),
            ),
            Container(
              color: Colors.orange,
              width: sf.dp(Dp.$20),
              height: sf.dp(Dp.$60),
            ),
            Container(
              color: Colors.pink,
              width: 20.$dp,
              height: 60.$dp,
            ),
            Text("A 测", style: TextStyle(fontSize: sf.sp(Sp.$60))),
            Text("A 测",
                style: TextStyle(
                  fontSize: 60.$sp,
                ))
          ],
        ),
      ),
    );
  }
}
