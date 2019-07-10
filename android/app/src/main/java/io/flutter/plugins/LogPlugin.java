package io.flutter.plugins;

import android.util.Log;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.PluginRegistry;

public class LogPlugin implements MethodCallHandler {

    private static final String LOG_PLUGIN_CHANNEL_NAME = "io.flutter.plugins.LogPlugin";

    public static void registerWith(PluginRegistry.Registrar registrar){
        MethodChannel channel = new MethodChannel(registrar.messenger(), LOG_PLUGIN_CHANNEL_NAME);
        LogPlugin logPlugin = new LogPlugin();
        channel.setMethodCallHandler(logPlugin);
    }

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
}
