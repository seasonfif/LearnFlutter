
import 'package:flutter/services.dart';

class LogUtil{

  static const _platform = const MethodChannel("io.flutter.plugins.LogPlugin");

  static const String TAG = "flutter_log";

  LogUtil._();

  static void d(String msg, {String tag=TAG}){
    // _platform.invokeMethod('logd', {'tag': tag, 'msg': msg});
  }

  static void e(String msg, {String tag=TAG}){
    // _platform.invokeMethod('loge', {'tag': tag, 'msg': msg});
  }
}