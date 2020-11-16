// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/services.dart';

import 'CustomPlatform.dart';

class MethodChannelPlatform implements PlatformController {

  MethodChannelPlatform(int id, this._platformCallbacksHandler)
      : _channel = MethodChannel('plugins.flutter.PlatformView_$id') {
    _channel.setMethodCallHandler(_onMethodCall);
  }

  final PlatformCallbacksHandler _platformCallbacksHandler;
  final MethodChannel _channel;

  Future<bool> _onMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'setFlutterText':
        final String text = call.arguments['text'];
        _platformCallbacksHandler.setFlutterText(text);
        return true;
    }

    throw MissingPluginException(
      '${call.method} was invoked but has no handler',
    );
  }

  @override
  Future<void> setText(String text) async {
    return await _channel.invokeMethod<void>('setText', <String, dynamic>{
      'text': text,
    });
  }
}
