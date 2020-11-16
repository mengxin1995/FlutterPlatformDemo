package com.plugin.flutter_platform_demo;

import android.content.Context;
import android.view.View;
import android.widget.TextView;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

public class CustomPlatformView implements PlatformView, MethodChannel.MethodCallHandler {

    private TextView mCustomView;

    public CustomPlatformView(Context context, BinaryMessenger messenger, int id, Map<String, Object> params, View containerView) {
//        LayoutInflater.from(context).inflate()
        mCustomView = new TextView(context);
        mCustomView.setText("我是自定义view");
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

    }

    @Override
    public View getView() {
        return mCustomView;
    }

    @Override
    public void dispose() {

    }
}
