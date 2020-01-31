part of flutter_notifee;

const String _pluginName = 'io.invertase.notifee.flutter_notifee';

const MethodChannel _channel = const MethodChannel(_pluginName);

typedef CallbackHandle _GetCallbackHandle(Function callback);

void _notifeeBackgroundEventCallbackDispatcher() {
  // Initialize state necessary for MethodChannels.
  WidgetsFlutterBinding.ensureInitialized();

  const MethodChannel _channel =
      MethodChannel('$_pluginName/background', JSONMethodCodec());

  _channel.setMethodCallHandler((MethodCall call) async {
    final dynamic args = call.arguments;
    final CallbackHandle handle = CallbackHandle.fromRawHandle(args[0]);

    final Function closure = PluginUtilities.getCallbackFromHandle(handle);

    if (closure == null) {
      print('Fatal: could not find background event callback');
      exit(-1);
    }

    if (closure is Function()) {
      closure();
    } else if (closure is Function(int)) {
      final int id = args[1];
      closure(id);
    }
  });

  _channel.invokeMethod('ready');
}

class Notifee {
  static StreamController<NotifeeEvent> onForegroundEventStreamController;
  static CallbackHandle onBackgroundEventCallbackHandler;

  static _GetCallbackHandle _getCallbackHandle =
      (Function callback) => PluginUtilities.getCallbackHandle(callback);

  // todo move to class handler
  static Future<void> onNativeEvent(MethodCall methodCall) async {
    if (onForegroundEventStreamController == null) {
      return;
    }

    Map data = methodCall.arguments;
    Map detail = data['detail'];

    switch (methodCall.method) {
      case "onNotificationEvent":
        onForegroundEventStreamController.add(NotifeeEvent(
          type: NotifeeEventType.fromNumber(data['type']),
          pressAction: NotifeeAndroidPressAction.fromMap(detail['pressAction']),
          input: detail['input'],
        ));
        break;
      case "onBlockStateEvent":
        onForegroundEventStreamController.add(NotifeeEvent(
            type: NotifeeEventType.fromNumber(data['type']),
            blocked: detail['blocked'],
            androidChannel:
                NotifeeNativeAndroidChannel.fromMap(detail['channel']),
            androidChannelGroup: NotifeeNativeAndroidChannelGroup.fromMap(
                detail['channelGroup'])));
        break;
      default:
        print('Unknown method call event: ${methodCall.method}');
    }
  }

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

  static Future<void> createChannels(
      List<NotifeeAndroidChannel> channels) async {
    if (Platform.isIOS) return null;

    List<Map> chanelList = [];
    for (NotifeeAndroidChannel channel in channels) {
      chanelList.add(channel.build());
    }
    await _channel.invokeMethod('createChannels', {'channels': chanelList});
  }

  static Future<String> createChannelGroup(
      NotifeeAndroidChannelGroup channelGroup) async {
    if (Platform.isIOS) return '';
    await _channel.invokeMethod(
        'createChannelGroup', {'channelGroup': channelGroup.build()});
    return channelGroup.id;
  }

  static Future<void> createChannelGroups(
      List<NotifeeAndroidChannelGroup> channelGroups) async {
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

  static Future<String> displayNotification(
      NotifeeNotification notification) async {
    await _channel.invokeMethod('displayNotification', {
      'notification': notification.build(),
    });
    return notification.id;
  }

  static Future<NotifeeNativeAndroidChannel> getChannel(
      String channelId) async {
    isNotNullOrEmpty('channelId', channelId);
    Map channel = await _channel.invokeMethod('getChannel', {
      'channelId': channelId,
    });

    if (channel == null) {
      return null;
    }

    return NotifeeNativeAndroidChannel.fromMap(channel);
  }

  static Future<List<NotifeeNativeAndroidChannel>> getChannels() async {
    List<Map> channels = await _channel.invokeListMethod<Map>('getChannels');
    List<NotifeeNativeAndroidChannel> nativeChannels = [];

    for (Map channel in channels) {
      nativeChannels.add(NotifeeNativeAndroidChannel.fromMap(channel));
    }

    return nativeChannels;
  }

  static Future<NotifeeNativeAndroidChannelGroup> getChannelGroup(
      String channelGroupId) async {
    isNotNullOrEmpty('channelGroupId', channelGroupId);
    Map channelGroup = await _channel.invokeMethod('getChannel', {
      'channelGroupId': channelGroupId,
    });

    if (channelGroup == null) {
      return null;
    }

    return NotifeeNativeAndroidChannelGroup.fromMap(channelGroup);
  }

  static Future<List<NotifeeNativeAndroidChannelGroup>>
      getChannelGroups() async {
    List<Map> channelGroups = await _channel.invokeListMethod<Map>('getChannelGroups');
    List<NotifeeNativeAndroidChannelGroup> nativeChannelGroups = [];

    for (Map channelGroup in channelGroups) {
      nativeChannelGroups
          .add(NotifeeNativeAndroidChannelGroup.fromMap(channelGroup));
    }

    return nativeChannelGroups;
  }

  static Future<NotifeeInitialNotification> getInitialNotification() async {
    Map initialNotificationMap =
        await _channel.invokeMapMethod<String, dynamic>('getInitialNotification');

    if (initialNotificationMap == null) {
      return null;
    }

    Map notification = initialNotificationMap['notification'];
    Map pressAction = initialNotificationMap['pressAction'];

    return NotifeeInitialNotification(
      notification: NotifeeNotification.fromMap(notification),
      androidPressAction: NotifeeAndroidPressAction.fromMap(pressAction),
      iosPressAction: null,
    );
  }

  static StreamController<NotifeeEvent> onForegroundEvent() {
    if (onForegroundEventStreamController == null) {
      onForegroundEventStreamController = new StreamController.broadcast();
      _channel.setMethodCallHandler(onNativeEvent);
    }

    return onForegroundEventStreamController;
  }

  static Future<void> onBackgroundEvent(Function callback) async {
    assert(callback != null);
    if (onBackgroundEventCallbackHandler != null) {
      throw 'onBackgroundEvent handler has already been registered';
    }

    final CallbackHandle handle =
        _getCallbackHandle(_notifeeBackgroundEventCallbackDispatcher);

    await _channel.invokeMethod('onBackgroundEvent', <dynamic>[handle.toRawHandle()]);
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
