package io.invertase.notifee.flutter_notifee;

import android.content.Context;
import android.content.res.AssetManager;
import android.util.Log;

import java.util.concurrent.atomic.AtomicBoolean;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.JSONMethodCodec;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.FlutterCallbackInformation;
import io.flutter.view.FlutterMain;

import static io.invertase.notifee.flutter_notifee.NotifeeFlutterPlugin.channelName;

public class NotifeeBackgroundExecutor implements MethodChannel.MethodCallHandler {
  private static final String TAG = "NotifeeBackgroundExecut";
  private static NotifeeBackgroundExecutor instance;

  private MethodChannel backgroundChannel;
  private FlutterEngine backgroundFlutterEngine;
  private AtomicBoolean isCallbackReady = new AtomicBoolean(false);

  public static void start(Context context, long callbackHandler) {
    if (NotifeeBackgroundExecutor.instance != null) {
      Log.w(NotifeeBackgroundExecutor.TAG, "Attempted to start a duplicate background isolate.");
      return;
    }

    NotifeeBackgroundExecutor executor = new NotifeeBackgroundExecutor();
    executor.startBackgroundIsolate(context, callbackHandler);
  }

  @Override
  public void onMethodCall(MethodCall call, MethodChannel.Result result) {
    switch (call.method) {
      case "ready":
        onReady(result);
        break;
      default:
        result.notImplemented();
        break;
    }
  }

  void startBackgroundIsolate(Context context, long callbackHandler) {
    if (isRunning()) {
      return;
    }

    if (backgroundFlutterEngine != null) {
      Log.e(TAG, "Background isolate already started");
      return;
    }

    String appBundlePath = FlutterMain.findAppBundlePath(context);
    AssetManager assets = context.getAssets();

    if (appBundlePath != null) {
      backgroundFlutterEngine = new FlutterEngine(context);

      FlutterCallbackInformation flutterCallbackHandler =
        FlutterCallbackInformation.lookupCallbackInformation(callbackHandler);

      DartExecutor executor = backgroundFlutterEngine.getDartExecutor();
      initMethodChannel(executor);
      DartExecutor.DartCallback dartCallback = new DartExecutor.DartCallback(assets, appBundlePath, flutterCallbackHandler);

      executor.executeDartCallback(dartCallback);
    }
  }

  public boolean isRunning() {
    return isCallbackReady.get();
  }

  /**
   * Called once a background callback handler has been registered in Dart land
   *
   * @param result
   */
  private void onReady(final MethodChannel.Result result) {
    isCallbackReady.set(true);
    result.success(null);
  }

  private void initMethodChannel(BinaryMessenger isolate) {
    backgroundChannel =
      new MethodChannel(
        isolate,
        channelName + "/background",
        JSONMethodCodec.INSTANCE
      );

    backgroundChannel.setMethodCallHandler(this);
  }
}
