import 'package:flutter/material.dart';

class CreationParams {
  CreationParams({
    this.initialUrl,
  });

  /// The initialUrl to load in the webview.
  ///
  /// When null the webview will be created without loading any page.
  final String initialUrl;

  @override
  String toString() {
    return '$runtimeType(initialUrl: $initialUrl)';
  }
}

abstract class CustomPlatform {
  Widget build({
    BuildContext context,
    CreationParams creationParams,
  });
}