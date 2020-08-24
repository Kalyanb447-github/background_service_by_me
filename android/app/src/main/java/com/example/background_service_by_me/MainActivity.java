package com.example.background_service_by_me;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private Intent forService;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // GeneratedPluginRegistrant.registerWith(this);
        forService = new Intent(MainActivity.this, MyService.class);

        // if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
        // startForegroundService(forService);
        // } else {
        // startService(forService);
        // }

        // create a method chellel key using the name of package
        new MethodChannel(getFlutterView(), "com.retroportalstudio.messages")
                .setMethodCallHandler(new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                        if (methodCall.method.equals("startService")) {
                            startService();
                            result.success("Service Started");
                        }
                        if (methodCall.method.equals("stopService")) {
                            stopService(forService);
                            result.success("stopService");
                        }
                    }
                });

    }

    // @Override
    // protected void onDestroy() {
    // super.onDestroy();
    // stopService(forService);
    // }

    private void startService() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(forService);
        } else {
            startService(forService);
        }
    }

}
