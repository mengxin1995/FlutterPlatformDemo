import 'package:flutter/material.dart';
import 'package:flutter_platform_demo/CustomPlatform.dart';
import 'package:flutter_platform_demo/customPlatformView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  PlatformController controller;
  String text = "初始化";
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.amberAccent,
                  width: 100,
                  height: 100,
                  child: CustomPlatformView(
                    onPlatformCreatedCallback: (con) {
                      controller = con;
                    },
                    setText: (str) {
                      setState(() {
                        text = str;
                      });
                    },
                  )
              ),
              InkWell(
                onTap: () {
                  controller.setText("由flutter點擊生成");
                },
                child: Text(
                    "点击我调用原生",
                ),
              ),
              Text(
                text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
