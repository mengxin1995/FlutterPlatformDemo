import 'package:flutter/material.dart';
import 'AndroidCustomPlatformView.dart';

class CustomPlatformView extends StatefulWidget {
  @override
  _PlatformViewState createState() => _PlatformViewState();
}

class _PlatformViewState extends State<CustomPlatformView> {
  @override
  Widget build(BuildContext context) {
    return AndroidCustomPlatformView().build(context: context, creationParams: {
      "initText": "来自flutter的初始化"
    });
  }
}
