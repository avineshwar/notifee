package io.invertase.notifee.flutter_notifee;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.Keep;

import java.util.HashMap;

import app.notifee.core.EventListener;
import app.notifee.core.events.BlockStateEvent;
import app.notifee.core.events.ForegroundServiceEvent;
import app.notifee.core.events.LogEvent;
import app.notifee.core.events.NotificationEvent;
import io.flutter.plugin.common.MethodChannel;

import static io.invertase.notifee.flutter_notifee.NotifeeUtils.createHashMapFromBundle;
import static io.invertase.notifee.flutter_notifee.NotifeeUtils.isAppInForeground;

@Keep
public class NotifeeEventSubscriber implements EventListener {

  private static final String KEY_TYPE = "type";
  private static final String KEY_DETAIL = "detail";
  private static final String KEY_BLOCKED = "blocked";
  private static final String KEY_NOTIFICATION = "notification";

  private static final String KEY_DETAIL_PRESS_ACTION = "pressAction";
  private static final String KEY_DETAIL_INPUT = "input";

  private static MethodChannel channel;

  static void attachMethodChannel(MethodChannel methodChannel) {
    channel = methodChannel;
  }

  @Override
  public void onNotificationEvent(NotificationEvent notificationEvent) {
    if (channel == null) {
      return;
    }

    HashMap<String, Object> eventMap = new HashMap<>();
    eventMap.put(KEY_TYPE, notificationEvent.getType());

    HashMap<String, Object> eventDetail = new HashMap<>();
    eventDetail.put(KEY_NOTIFICATION, createHashMapFromBundle(notificationEvent.getNotification().toBundle()));

    Bundle extras = notificationEvent.getExtras();
    if (extras != null) {
      Bundle pressAction = extras.getBundle(KEY_DETAIL_PRESS_ACTION);
      if (pressAction != null) {
        eventDetail.put(KEY_DETAIL_PRESS_ACTION, createHashMapFromBundle(pressAction));
      }

      String input = extras.getString(KEY_DETAIL_INPUT);
      if (input != null) {
        eventDetail.put(KEY_DETAIL_INPUT, input);
      }
    }

    eventMap.put(KEY_DETAIL, eventDetail);

    if (isAppInForeground()) {
      new Handler(Looper.getMainLooper()).post(() -> channel.invokeMethod("onNotificationEvent", eventMap));
    } else {
      // todo handle in background
    }
  }

  @Override
  public void onLogEvent(LogEvent logEvent) {
    // TODO
  }

  @Override
  public void onBlockStateEvent(BlockStateEvent blockStateEvent) {
    HashMap<String, Object> eventMap = new HashMap<>();
    eventMap.put(KEY_TYPE, blockStateEvent.getType());

    HashMap<String, Object> eventDetail = new HashMap<>();

    int type = blockStateEvent.getType();

    if (type == BlockStateEvent.TYPE_CHANNEL_BLOCKED ||
      type == BlockStateEvent.TYPE_CHANNEL_GROUP_BLOCKED) {
      String mapKey = type == BlockStateEvent.TYPE_CHANNEL_BLOCKED ? "channel" : "channelGroup";
      Bundle channelOrGroupBundle = blockStateEvent.getChannelOrGroupBundle();
      if (channelOrGroupBundle != null) {
        eventDetail.put(mapKey, createHashMapFromBundle(blockStateEvent.getChannelOrGroupBundle()));
      }
    }

    if (type == BlockStateEvent.TYPE_APP_BLOCKED) {
      eventDetail.put(KEY_BLOCKED, blockStateEvent.isBlocked());
    }

    eventMap.put(KEY_DETAIL, eventDetail);

    if (isAppInForeground()) {
      new Handler(Looper.getMainLooper()).post(() -> channel.invokeMethod("onBlockStateEvent", eventMap));
    } else {
      // todo handle in background
    }
  }

  @Override
  public void onForegroundServiceEvent(ForegroundServiceEvent foregroundServiceEvent) {

  }
}
