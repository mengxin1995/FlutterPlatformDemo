package com.plugin.flutter_platform_demo;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterPlatformDemoPlugin */
public class FlutterPlatformDemoPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    BinaryMessenger messenger = flutterPluginBinding.getBinaryMessenger();
    flutterPluginBinding
            .getFlutterEngine()
            .getPlatformViewsController()
            .getRegistry()
            .registerViewFactory(
                    "plugins.flutter.PlatformView", new CustomPlatformViewFactory(messenger, /*containerView=*/ null));
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  public static void registerWith(Registrar registrar) {
    registrar
            .platformViewRegistry()
            .registerViewFactory(
                    "plugins.flutter.PlatformView",
                    new CustomPlatformViewFactory(registrar.messenger(), registrar.view()));
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {

  }
}
