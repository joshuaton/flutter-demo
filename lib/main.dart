import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/my_homepage.dart';
import 'package:flutter_demo/page0.dart';
import 'package:flutter_demo/page1.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  MethodChannel _methodChannel = MethodChannel("com.junshao");
  Widget _currentWidget = MyHomePage(title: 'My Flutter Demo',);

  @override
  void initState() {
    super.initState();
    _methodChannel.setMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == "changeRoute") {
        String routeName = methodCall.arguments['routeName'];
        setState(() {
          _currentWidget = _getWidget(routeName);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _currentWidget,
    );
  }

  Widget _getWidget(String routeName) {
    if (routeName == 'page0') {
      return Page0();
    } else if (routeName == 'page1') {
      return Page1();
    }
    return Page0();
  }
}
