package io.flutter.plugins;

import android.util.Log;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class LogPlugin {

    private static final String LOG_PLUGIN_CHANNEL_NAME = "io.flutter.plugins/log";

    public static void register(BinaryMessenger messenger){
        new MethodChannel(messenger, LOG_PLUGIN_CHANNEL_NAME)
                .setMethodCallHandler(new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                        String tag = methodCall.argument("tag");
                        String msg = methodCall.argument("msg");
                        switch (methodCall.method){
                            case "logd":
                                Log.d(tag, msg);
                                break;
                            case "loge":
                                Log.e(tag, msg);
                                break;
                        }
                    }
                });
    }
}
