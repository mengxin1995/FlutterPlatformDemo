import 'package:flutter/material.dart';

abstract class PlatformController {
  Future<void> setText(String text);
}

typedef OnPlatformCreatedCallback = void Function(
    PlatformController platformController);

abstract class CustomPlatform {
  Widget build({
    BuildContext context,
    Map creationParams,
    OnPlatformCreatedCallback onPlatformCreatedCallback,
  });
}