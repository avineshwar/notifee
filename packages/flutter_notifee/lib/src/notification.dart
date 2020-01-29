part of flutter_notifee;

class NotifeeInitialNotification {
  Notification notification;
  String androidPressAction; // todo
  String iosPressAction; // todo

  NotifeeInitialNotification({
    @required this.notification,
    this.androidPressAction,
    this.iosPressAction,
  });

  Map get pressAction {
    if (Platform.isAndroid) {
      return {}; // androidPressAction.build()
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

  NotifeeNotification({
    this.body,
    this.id,
    this.title,
    this.subtitle,
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

class NotifeeAndroidNotification extends NotifeeBridge {
  List actions; // todo
  bool asForegroundService;
  bool autoCancel;
  NotifeeAndroidBadgeIconType badgeIconType;
  NotifeeAndroidCategory category;
  String channelId;
  NotifeeAndroidColor color;
  bool colorized;
  String chronometerDirection;
  List defaults; // todo
  String groupId;

//  AndroidGroupAlertBehaviour groupAlertBehaviour; // todo
  bool groupSummary;
  List<String> inputHistory;
  String largeIcon;
  List<dynamic> lights;
  bool localOnly;
  num number;
  bool ongoing;
  bool onlyAlertOnce;

//  AndroidPressAction pressAction; // todo
//  AndroidImportance importance; // todo w/ default
//  AndroidProgress progress; // todo
  bool showTimestamp;
  String smallIcon;
  num smallIconLevel;

//  AndroidStyle style; // todo
  String tag;
  String ticker;
  num timeoutAfter;
  bool showChronometer;
  List<num> vibrationPattern;

//  AndroidVisibility visibility; // todo
  num timestamp;

  NotifeeAndroidNotification({
    this.actions,
    this.asForegroundService = false,
    this.autoCancel = true,
    this.badgeIconType = NotifeeAndroidBadgeIconType.LARGE,
    this.category,
    @required this.channelId,
    this.color,
    this.colorized = false,
    this.chronometerDirection = 'up',
    this.defaults,
    this.groupId,
//    this.groupAlertehaviour,
    this.groupSummary = false,
    this.inputHistory,
    this.largeIcon,
    this.lights,
    this.localOnly = false,
    this.number,
    this.ongoing = false,
    this.onlyAlertOnce = false,
//    this.pressAction,
//    this.importance,
//    this.progress,
    this.showTimestamp = false,
    this.smallIcon = 'ic_launcher',
    this.smallIconLevel,
//    this.style,
    this.tag,
    this.ticker,
    this.timeoutAfter,
    this.showChronometer = false,
    this.vibrationPattern,
//    this.visibility,
    this.timestamp,
  });

  // todo check all params
  Map build() {
    isNotNullOrEmpty('channelId', channelId);

    Map androidNotification = {
      'asForegroundService': asForegroundService,
      'autoCancel': autoCancel,
      'badgeIconType': badgeIconType,
      'colorized': color,
      'channelId': channelId,
      'chronometerDirection': chronometerDirection,
      'defaults': [], // todo
      'groupAlertBehaviour': null, // todo
      'groupSummary': groupSummary,
      'localOnly': localOnly,
      'ongoing': ongoing,
      'onlyAlertOnce': onlyAlertOnce,
      'importance': null, // todo
      'showTimestamp': showTimestamp,
      'smallIcon': smallIcon,
      'showChronometer': showChronometer,
      'visibility': null, // todo
    };

    if (actions != null) {
//      androidNotification['actions'] = actions.build();
    }

    if (category != null)
      androidNotification['category'] = androidCategoryToString(category);

    if (color != null) androidNotification['color'] = color.toString();

    if (groupId != null) androidNotification['groupId'] = groupId;

    if (lights != null) {
      assert(lights[0] == NotifeeAndroidColor);
      assert(lights[1] is num && lights[1] > 0);
      assert(lights[2] is num && lights[2] > 0);
      androidNotification['lights'] = lights;
    }

//    if (pressAction != null)
//      androidNotification['pressAction'] = pressAction.build();

//    if (progress != null)
//      androidNotification['progress'] = progress.build();

//    if (style != null)
//      androidNotification['style'] = style.build();

    if (timeoutAfter != null) {
      assert(
          timeoutAfter > 0, '"timeoutAfter" must be a number greater than 0');
      androidNotification['timeoutAfter'] = timeoutAfter;
    }

    if (vibrationPattern != null) {
      assert(vibrationPattern.length % 2 != 0,
          'vibration pattern must be a list of even positive numbers');
      for (num p in vibrationPattern) {
        assert(p > 0, 'all vibration pattern values must be greater than 0');
      }
    }

    if (timestamp != null) {
      androidNotification['timestamp'] = timestamp;
    }

    return androidNotification;
  }
}

class IOSNotification extends NotifeeBridge {
  IOSNotification();

  Map build() {
    return {};
  }
}
