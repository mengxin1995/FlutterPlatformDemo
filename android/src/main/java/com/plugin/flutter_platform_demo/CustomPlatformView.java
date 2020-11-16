package com.plugin.flutter_platform_demo;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;

import org.w3c.dom.Text;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

public class CustomPlatformView implements PlatformView, MethodChannel.MethodCallHandler {

    private View theContainerView;

    public CustomPlatformView(Context context, BinaryMessenger messenger, int id, Map<String, Object> params, View containerView) {
        theContainerView = LayoutInflater.from(context).inflate(R.layout.test, null);
        TextView tv = (TextView)theContainerView.findViewById(R.id.tv);
        tv.setText(params.get("initText").toString());
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

    }

    @Override
    public View getView() {
        return theContainerView;
    }

    @Override
    public void dispose() {

    }
}
