import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CustomPlatform.dart';
import 'MethodChannel.dart';

class AndroidCustomPlatformView implements CustomPlatform {
  @override
  Widget build({
    BuildContext context,
    Map creationParams,
    OnPlatformCreatedCallback onPlatformCreatedCallback,
  }) {
    return GestureDetector(
      onLongPress: () {},
      excludeFromSemantics: true,
      child: AndroidView(
        viewType: 'plugins.flutter.PlatformView',
        onPlatformViewCreated: (int id) {
          print('@@@@ onPlatformViewCreated');
          if (onPlatformCreatedCallback == null) {
            return;
          }
          onPlatformCreatedCallback(MethodChannelPlatform(id));
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