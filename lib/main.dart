import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void startServiceInPlatform() async {
    if (Platform.isAndroid) {
      //create a key using the name of package
      var methodChannel = MethodChannel("com.retroportalstudio.messages");
      //call a function called startService
      String data = await methodChannel.invokeMethod("startService");
      debugPrint(data);
    }
  }

  void stopServiceInPlatform() async {
    if (Platform.isAndroid) {
      //create a key using the name of package
      var methodChannel = MethodChannel("com.retroportalstudio.messages");
      //call a function called startService
      String data = await methodChannel.invokeMethod("stopService");
      debugPrint(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("Start Background"),
            onPressed: () {
              startServiceInPlatform();
            },
          ),
          RaisedButton(
            child: Text("Stop Background"),
            onPressed: () {
              stopServiceInPlatform();
            },
          )
        ],
      ),
    );
  }
}
