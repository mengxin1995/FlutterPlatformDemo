// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/services.dart';

import 'CustomPlatform.dart';

class MethodChannelPlatform implements PlatformController {

  MethodChannelPlatform(int id)
      : _channel = MethodChannel('plugins.flutter.PlatformView_$id') {
//    _channel.setMethodCallHandler(_onMethodCall);
  }
//
//  final PlatformCallbacksHandler _platformCallbacksHandler;
//
  final MethodChannel _channel;
//
//  static const MethodChannel _cookieManagerChannel =
//      MethodChannel('plugins.flutter.io/cookie_manager');
//
//  Future<bool> _onMethodCall(MethodCall call) async {
//    switch (call.method) {
//      case 'javascriptChannelMessage':
//        final String channel = call.arguments['channel'];
//        final String message = call.arguments['message'];
//        _platformCallbacksHandler.onJavaScriptChannelMessage(channel, message);
//        return true;
//      case 'navigationRequest':
//        return await _platformCallbacksHandler.onNavigationRequest(
//          url: call.arguments['url'],
//          isForMainFrame: call.arguments['isForMainFrame'],
//        );
//      case 'onPageFinished':
//        _platformCallbacksHandler.onPageFinished(call.arguments['url']);
//        return null;
//      case 'onPageStarted':
//        _platformCallbacksHandler.onPageStarted(call.arguments['url']);
//        return null;
//      case 'onWebResourceError':
//        _platformCallbacksHandler.onWebResourceError(
//          WebResourceError(
//            errorCode: call.arguments['errorCode'],
//            description: call.arguments['description'],
//            domain: call.arguments['domain'],
//            failingUrl: call.arguments['failingUrl'],
//            errorType: call.arguments['errorType'] == null
//                ? null
//                : WebResourceErrorType.values.firstWhere(
//                    (WebResourceErrorType type) {
//                      return type.toString() ==
//                          '$WebResourceErrorType.${call.arguments['errorType']}';
//                    },
//                  ),
//          ),
//        );
//        return null;
//    }
//
//    throw MissingPluginException(
//      '${call.method} was invoked but has no handler',
//    );
//  }

  @override
  Future<void> setText(String text) async {
    return await _channel.invokeMethod<void>('setText', <String, dynamic>{
      'text': text,
    });
  }
}
