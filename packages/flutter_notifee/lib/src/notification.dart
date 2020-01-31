part of flutter_notifee;

class NotifeeInitialNotification {
  NotifeeNotification notification;
  NotifeeAndroidPressAction androidPressAction;
  String iosPressAction; // todo

  NotifeeInitialNotification({
    @required this.notification,
    this.androidPressAction,
    this.iosPressAction,
  });

  Map get pressAction {
    if (Platform.isAndroid) {
      return androidPressAction.build();
    }
    return {}; // iosPressAction.build()
  }
}

class NotifeeNotification extends NotifeeBridge {
  String body;
  String id;
  String title;
  String subtitle;
  Map<String, String> data;
  NotifeeAndroidNotification android;
  IOSNotification ios;

  static NotifeeNotification fromMap(Map map) {
    return NotifeeNotification(
      body: map['body'],
      id: map['id'],
      title: map['title'],
      subtitle: map['subtitle'],
      data: convertLinkedHashMap<String, String>(map['data']),
      android: NotifeeAndroidNotification.fromMap(map['android']),
      ios: null,
    );
  }

  NotifeeNotification({
    this.body = '',
    this.id,
    this.title = '',
    this.subtitle = '',
    this.data,
    this.android,
    this.ios,
  });

  Map build() {
    return {
      'body': body,
      'id': id ?? IdGenerator.randomId(),
      'title': title,
      'subtitle': subtitle,
      'data': data ?? {},
      'android': android?.build() ?? {},
      'ios': ios?.build() ?? {},
    };
  }
}

class IOSNotification extends NotifeeBridge {
  IOSNotification();

  static IOSNotification fromMap(Map map) {
    return IOSNotification();
  }

  Map build() {
    return {};
  }
}
