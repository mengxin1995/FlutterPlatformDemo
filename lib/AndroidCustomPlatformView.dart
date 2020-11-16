import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CustomPlatform.dart';

class AndroidCustomPlatformView implements CustomPlatform {
  @override
  Widget build({
    BuildContext context,
    Map creationParams,
  }) {
    return GestureDetector(
      onLongPress: () {},
      excludeFromSemantics: true,
      child: AndroidView(
        viewType: 'plugins.flutter.PlatformView',
        onPlatformViewCreated: (int id) {
        },
//        gestureRecognizers: gestureRecognizers,
        // WebView content is not affected by the Android view's layout direction,
        // we explicitly set it here so that the widget doesn't require an ambient
        // directionality.
        layoutDirection: TextDirection.rtl,
        creationParams: creationParams ?? {},
        creationParamsCodec: const StandardMessageCodec(),
      ),
    );
  }
}