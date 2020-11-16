import 'package:flutter/material.dart';
import 'AndroidCustomPlatformView.dart';
import 'CustomPlatform.dart';

class CustomPlatformView extends StatefulWidget {

  SetText setText;
  OnPlatformCreatedCallback onPlatformCreatedCallback;

  CustomPlatformView({this.onPlatformCreatedCallback, this.setText});

  @override
  _PlatformViewState createState() => _PlatformViewState();
}

class _PlatformViewState extends State<CustomPlatformView> {

  PlatformCallbacksHandler _platformCallbacksHandler;

  @override
  void initState() {
    super.initState();
    _platformCallbacksHandler = _PlatformCallbacksHandler(widget);
  }

  @override
  Widget build(BuildContext context) {
    return AndroidCustomPlatformView().build(
      context: context,
      creationParams: {
          "initText": "来自flutter的初始化"
      },
      onPlatformCreatedCallback: widget.onPlatformCreatedCallback,
      platformCallbacksHandler: _platformCallbacksHandler,
    );
  }
}

class _PlatformCallbacksHandler implements PlatformCallbacksHandler {

  CustomPlatformView _widget;

  _PlatformCallbacksHandler(this._widget);

  @override
  void setFlutterText(String text) {
    if (_widget.setText != null) {
      _widget.setText(text);
    }
  }
}
