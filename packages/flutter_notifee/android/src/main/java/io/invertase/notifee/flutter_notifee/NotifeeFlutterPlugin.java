package io.invertase.notifee.flutter_notifee;

import android.os.Bundle;
import android.util.Log;

import androidx.annotation.NonNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.notifee.core.Notifee;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import static io.invertase.notifee.flutter_notifee.NotifeeFlutterUtils.createBundleFromMap;
import static io.invertase.notifee.flutter_notifee.NotifeeFlutterUtils.resultResolver;

public class NotifeeFlutterPlugin implements FlutterPlugin, MethodCallHandler {
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
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "io.invertase.notifee.flutter_notifee");
        channel.setMethodCallHandler(new NotifeeFlutterPlugin());
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        final MethodChannel channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "io.invertase.notifee.flutter_notifee");
        channel.setMethodCallHandler(new NotifeeFlutterPlugin());
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        Map arguments = new HashMap<>();

        if (call.arguments != null) {
            arguments = (Map) call.arguments;
        }

        switch (call.method) {
            case "createChannel":
                createChannel(arguments, result);
                break;
            case "displayNotification":
                displayNotification(arguments, result);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    }

    private void createChannel(Map arguments, @NonNull final Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> channel = (HashMap<String, Object>) arguments.get("channel");
        Notifee.getInstance().createChannel(createBundleFromMap(channel), (e, aVoid) -> resultResolver(result, e));
    }

    private void displayNotification(Map arguments, @NonNull final Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> notification = (HashMap<String, Object>) arguments.get("notification");
        Bundle not = createBundleFromMap(notification);
        Notifee.getInstance().displayNotification(not, (e, aVoid) -> resultResolver(result, e));
    }

    private void createChannelGroup(Map arguments, @NonNull final Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> channelGroup = (HashMap<String, Object>) arguments.get("channelGroup");
        Notifee.getInstance().createChannelGroup(createBundleFromMap(channelGroup), (e, aVoid) -> resultResolver(result, e));
    }
}
