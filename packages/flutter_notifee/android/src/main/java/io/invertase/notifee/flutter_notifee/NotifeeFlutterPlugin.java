package io.invertase.notifee.flutter_notifee;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;

import androidx.annotation.NonNull;

import org.json.JSONArray;
import org.json.JSONException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import app.notifee.core.Notifee;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import static io.invertase.notifee.flutter_notifee.NotifeeUtils.createBundleFromMap;
import static io.invertase.notifee.flutter_notifee.NotifeeUtils.createListFromObjects;
import static io.invertase.notifee.flutter_notifee.NotifeeUtils.resultResolver;

public class NotifeeFlutterPlugin implements FlutterPlugin, MethodCallHandler {
    static String channelName = "io.invertase.notifee.flutter_notifee";
    static private String TAG = "NotifeeFlutterPlugin";
    static private NotifeeFlutterPlugin instance;

    private final Object initializationLock = new Object();
    private Context context;
    private Activity activity;
    private MethodChannel pluginChannel;

    // Keep for backwards compatibility
    public static void registerWith(Registrar registrar) {
        if (instance == null) {
            instance = new NotifeeFlutterPlugin();
        }
        instance.onAttachedToEngine(registrar.context(), registrar.messenger());
    }

    public void onAttachedToEngine(Context applicationContext, BinaryMessenger messenger) {
        synchronized (initializationLock) {
            if (pluginChannel != null) {
                return;
            }

            this.context = applicationContext;

            pluginChannel = new MethodChannel(messenger, NotifeeFlutterPlugin.channelName);
            pluginChannel.setMethodCallHandler(this);
        }
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        onAttachedToEngine(binding.getApplicationContext(), binding.getBinaryMessenger());
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        context = null;
        pluginChannel.setMethodCallHandler(null);
        pluginChannel = null;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        Map arguments = new HashMap<>();

        if (call.arguments != null) {
            arguments = (Map) call.arguments;
        }

        switch (call.method) {
            case "cancelNotification":
                cancelNotification(arguments, result);
                break;
            case "cancelAllNotifications":
                cancelAllNotifications(result);
                break;
            case "createChannel":
                createChannel(arguments, result);
                break;
            case "createChannels":
                createChannels(arguments, result);
                break;
            case "createChannelGroup":
                createChannelGroup(arguments, result);
                break;
            case "createChannelGroups":
                createChannelGroups(arguments, result);
                break;
            case "deleteChannel":
                deleteChannel(arguments, result);
                break;
            case "deleteChannelGroup":
                deleteChannelGroup(arguments, result);
                break;
            case "displayNotification":
                displayNotification(arguments, result);
                break;
            case "getAllChannels":
                getAllChannels(result);
                break;
            case "getChannel":
                getChannel(arguments, result);
                break;
            case "getAllChannelGroups":
                getAllChannelGroups(result);
                break;
            case "getChannelGroup":
                getChannelGroup(arguments, result);
                break;
            case "getInitialNotification":
                getInitialNotification(result);
                break;
            case "onBackgroundEvent":
                onBackgroundEvent(arguments, result);
                break;
            case "openNotificationSettings":
                openNotificationSettings(arguments, result);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void cancelNotification(Map arguments, @NonNull final Result result) {
        String notificationId = (String) arguments.get("notificationId");
        Notifee.getInstance().cancelNotification(Objects.requireNonNull(notificationId), (e, aVoid) -> resultResolver(result, e));
    }

    private void cancelAllNotifications(@NonNull final Result result) {
        Notifee.getInstance().cancelAllNotifications((e, aVoid) -> resultResolver(result, e));
    }

    @SuppressWarnings("unchecked")
    private void createChannel(Map arguments, @NonNull final Result result) {
        HashMap<String, Object> channel = (HashMap<String, Object>) arguments.get("channel");
        Notifee.getInstance().createChannel(createBundleFromMap(channel), (e, aVoid) -> resultResolver(result, e));
    }

    @SuppressWarnings("unchecked")
    private void createChannels(Map arguments, @NonNull final Result result) {
        ArrayList<Object> channels = (ArrayList<Object>) arguments.get("channels");
        ArrayList<Bundle> bundleList = (ArrayList<Bundle>) createListFromObjects(Objects.requireNonNull(channels));
        Notifee.getInstance().createChannels(bundleList, (e, aVoid) -> resultResolver(result, e));
    }

    private void createChannelGroup(Map arguments, @NonNull final Result result) {
        @SuppressWarnings("unchecked")
        HashMap<String, Object> channelGroup = (HashMap<String, Object>) arguments.get("channelGroup");
        Notifee.getInstance().createChannelGroup(createBundleFromMap(channelGroup), (e, aVoid) -> resultResolver(result, e));
    }

    @SuppressWarnings("unchecked")
    private void createChannelGroups(Map arguments, @NonNull final Result result) {
        ArrayList<Object> channelGroups = (ArrayList<Object>) arguments.get("channelGroups");
        ArrayList<Bundle> bundleList = (ArrayList<Bundle>) createListFromObjects(Objects.requireNonNull(channelGroups));
        Notifee.getInstance().createChannelGroups(bundleList, (e, aVoid) -> resultResolver(result, e));
    }

    private void deleteChannel(Map arguments, @NonNull final Result result) {
        String channelId = (String) arguments.get("channelId");
        Notifee.getInstance().deleteChannel(channelId, (e, aVoid) -> resultResolver(result, e));
    }

    private void deleteChannelGroup(Map arguments, @NonNull final Result result) {
        String channelGroupId = (String) arguments.get("channelGroupId");
        Notifee.getInstance().deleteChannelGroup(channelGroupId, (e, aVoid) -> resultResolver(result, e));
    }

    @SuppressWarnings("unchecked")
    private void displayNotification(Map arguments, @NonNull final Result result) {
        HashMap<String, Object> notification = (HashMap<String, Object>) arguments.get("notification");
        Bundle not = createBundleFromMap(notification);
        Notifee.getInstance().displayNotification(not, (e, aVoid) -> resultResolver(result, e));
    }

    private void getAllChannels(@NonNull final Result result) {
        Notifee.getInstance().getAllChannels((e, aBundleList) -> resultResolver(result, e, aBundleList));
    }

    private void getChannel(Map arguments, @NonNull final Result result) {
        String channelId = (String) arguments.get("channelId");
        Notifee.getInstance().getChannel(channelId, (e, aBundle) -> resultResolver(result, e, aBundle));
    }

    private void getAllChannelGroups(@NonNull final Result result) {
        Notifee.getInstance().getAllChannelGroups((e, aBundleList) -> resultResolver(result, e, aBundleList));
    }

    private void getChannelGroup(Map arguments, @NonNull final Result result) {
        String channelGroupId = (String) arguments.get("channelGroupId");
        Notifee.getInstance().getChannelGroup(channelGroupId, (e, aBundle) -> resultResolver(result, e, aBundle));
    }

    private void onBackgroundEvent(Map arguments, @NonNull final Result result) {
        try {
            long callbackHandler = ((JSONArray) arguments).getLong(0);
            NotifeeBackgroundExecutor.start(context, callbackHandler);
            resultResolver(result, null);
        } catch (JSONException e) {
            resultResolver(result, e);
        }
    }

    private void getInitialNotification(@NonNull final Result result) {
        Notifee.getInstance().getInitialNotification((e, aBundle) -> resultResolver(result, e, aBundle));
    }

    private void openNotificationSettings(Map arguments, @NonNull final Result result) {
        String channelId = (String) arguments.get("channelId");
        Notifee.getInstance().openNotificationSettings(channelId, activity, (err, aVoid) -> resultResolver(result, err));
    }
}
