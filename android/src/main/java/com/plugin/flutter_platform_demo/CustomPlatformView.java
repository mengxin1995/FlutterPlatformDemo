package com.plugin.flutter_platform_demo;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import org.w3c.dom.Text;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

public class CustomPlatformView implements PlatformView, MethodChannel.MethodCallHandler {

    private View theContainerView;
    private TextView tv;
    private final MethodChannel methodChannel;

    public CustomPlatformView(Context context, BinaryMessenger messenger, int id, Map<String, Object> params, View containerView) {
        theContainerView = LayoutInflater.from(context).inflate(R.layout.test, null);
        tv = (TextView)theContainerView.findViewById(R.id.tv);
        tv.setText(params.get("initText").toString());
        Button btn = (Button) theContainerView.findViewById(R.id.btn);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Map<String, Object> args = new HashMap<>();
                args.put("text", "原始点击传递过来");
                methodChannel.invokeMethod("setFlutterText", args);
            }
        });
        methodChannel = new MethodChannel(messenger, "plugins.flutter.PlatformView_" + id);
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method) {
            case "setText":
                HashMap arguments = (HashMap) methodCall.arguments;
                tv.setText(arguments.get("text").toString());
                break;
            default:
                result.notImplemented();
        }
    }

    @Override
    public View getView() {
        return theContainerView;
    }

    @Override
    public void dispose() {
        methodChannel.setMethodCallHandler(null);
    }
}
