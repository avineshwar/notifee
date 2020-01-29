part of flutter_notifee;

const MethodChannel _channel =
    const MethodChannel('io.invertase.notifee.flutter_notifee');

class Notifee {
  static Future<void> cancelAllNotifications() async {
    await _channel.invokeMethod('cancelAllNotifications');
  }

  static Future<void> cancelNotification(String notificationId) async {
    isNotNullOrEmpty('notificationId', notificationId);
    await _channel.invokeMethod('createChannel', {
      'notificationId': notificationId,
    });
  }

  static Future<String> createChannel(NotifeeAndroidChannel channel) async {
    if (Platform.isIOS) return '';
    await _channel.invokeMethod('createChannel', {'channel': channel.build()});
    return channel.id;
  }

  static Future<void> createChannels(List<NotifeeAndroidChannel> channels) async {
    if (Platform.isIOS) return null;
    for (NotifeeAndroidChannel channel in channels) {
      await createChannel(channel);
    }
  }

  static Future<String> createChannelGroup(NotifeeAndroidChannelGroup channelGroup) async {
    if (Platform.isIOS) return '';
    await _channel.invokeMethod('createChannelGroup', {'channelGroup': channelGroup.build()});
    return channelGroup.id;
  }

  static Future<void> createChannelGroups(List<NotifeeAndroidChannelGroup> channelGroups) async {
    if (Platform.isIOS) return null;
    for (NotifeeAndroidChannelGroup channelGroup in channelGroups) {
      await createChannelGroup(channelGroup);
    }
  }

  static Future<void> deleteChannel(String channelId) async {
    isNotNullOrEmpty('channelId', channelId);
    await _channel.invokeMethod('deleteChannel', {
      'channelId': channelId,
    });
  }

  static Future<void> deleteChannelGroup(String channelGroupId) async {
    if (Platform.isIOS) return null;
    isNotNullOrEmpty('channelGroupId', channelGroupId);
    await _channel.invokeMethod('deleteChannelGroup', {
      'channelGroupId': channelGroupId,
    });
  }

  static Future<String> displayNotification(NotifeeNotification notification) async {
    await _channel.invokeMethod('displayNotification', {
      'notification': notification.build(),
    });
    return notification.id;
  }

  static Future<NotifeeNativeAndroidChannel> getChannel(String channelId) async {
    isNotNullOrEmpty('channelId', channelId);
    Map<String, dynamic> channel = await _channel.invokeMethod('getChannel', {
      'channelId': channelId,
    });

    if (channel == null) {
      return null;
    }

    return NotifeeNativeAndroidChannel(
      id: channel['id'],
      name: channel['name'],
      badge: channel['badge'],
      bypassDnd: channel['bypassDnd'],
      description: channel['description'],
      lights: channel['lights'],
      groupId: channel['groupId'],
      sound: channel['sound'],
      blocked: channel['blocked'],
    );
  }

  static Future<List<NotifeeNativeAndroidChannel>> getChannels() async {
    List<Map<String, dynamic>> channels = await _channel.invokeMethod('getChannels');
    List<NotifeeNativeAndroidChannel> nativeChannels = [];

    for (Map<String, dynamic> channel in channels) {
      nativeChannels.add(NotifeeNativeAndroidChannel(
        id: channel['id'],
        name: channel['name'],
        badge: channel['badge'],
        bypassDnd: channel['bypassDnd'],
        description: channel['description'],
        lights: channel['lights'],
        groupId: channel['groupId'],
        sound: channel['sound'],
        blocked: channel['blocked'],
      ));
    }

    return nativeChannels;
  }

  static Future<NotifeeNativeAndroidChannelGroup> getChannelGroup(String channelGroupId) async {
    isNotNullOrEmpty('channelGroupId', channelGroupId);
    Map<String, dynamic> channelGroup = await _channel.invokeMethod('getChannel', {
      'channelGroupId': channelGroupId,
    });

    if (channelGroup == null) {
      return null;
    }

    return NotifeeNativeAndroidChannelGroup(
      id: channelGroup['id'],
      name: channelGroup['name'],
      blocked: channelGroup['blocked'],
    );
  }

  static Future<List<NotifeeNativeAndroidChannelGroup>> getChannelGroups() async {
    List<Map<String, dynamic>> channelGroups = await _channel.invokeMethod('getChannelGroups');
    List<NotifeeNativeAndroidChannelGroup> nativeChannelGroups = [];

    for (Map<String, dynamic> channelGroup in channelGroups) {
      nativeChannelGroups.add(NotifeeNativeAndroidChannelGroup(
        id: channelGroup['id'],
        name: channelGroup['name'],
        blocked: channelGroup['blocked'],
      ));
    }

    return nativeChannelGroups;
  }

  static Future<NotifeeInitialNotification> getInitialNotification() async {
    Map<String, dynamic> initialNotificationMap = await _channel.invokeMethod('getInitialNotification');

    if (initialNotificationMap == null) {
      return null;
    }

    return NotifeeInitialNotification(
      notification: initialNotificationMap['notification'],
      androidPressAction: Platform.isAndroid ? initialNotificationMap['pressAction'] : null,
      iosPressAction: Platform.isIOS ? initialNotificationMap['pressAction'] : null,
    );
  }

  static Future<void> onEvent() {
    return null;
  }

  static Future<void> openNotificationSettings([String channelId]) async {
    await _channel.invokeMethod('openNotificationSettings', {
      'channelId': channelId,
    });
  }

  static Future<void> registerForegroundService() {
    return null;
  }
}

abstract class NotifeeBridge {
  Map build();
}