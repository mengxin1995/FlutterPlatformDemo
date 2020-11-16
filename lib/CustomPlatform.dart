import 'package:flutter/material.dart';

abstract class PlatformController {
  Future<void> setText(String text);
}

abstract class PlatformCallbacksHandler {
  void setFlutterText(String text);
}

typedef OnPlatformCreatedCallback = void Function(
    PlatformController platformController);

typedef void SetText(String text);

abstract class CustomPlatform {
  Widget build({
    BuildContext context,
    Map creationParams,
    OnPlatformCreatedCallback onPlatformCreatedCallback,
    PlatformCallbacksHandler platformCallbacksHandler
  });
}