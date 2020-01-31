part of flutter_notifee;

class NotifeeAndroidNotification extends NotifeeBridge {
  List<NotifeeAndroidAction> actions;
  bool asForegroundService;
  bool autoCancel;
  NotifeeAndroidBadgeIconType badgeIconType;
  NotifeeAndroidCategory category;
  String channelId;
  NotifeeAndroidColor color;
  bool colorized;
  String chronometerDirection;
  List<NotifeeAndroidDefaults> defaults;
  String groupId;
  NotifeeAndroidGroupAlertBehaviour groupAlertBehaviour;
  bool groupSummary;
  List<String> inputHistory;
  String largeIcon;
  List<dynamic> lights;
  bool localOnly;
  num number;
  bool ongoing;
  bool onlyAlertOnce;
  NotifeeAndroidPressAction pressAction;
  NotifeeAndroidImportance importance;
  NotifeeAndroidProgressIndicator progress;
  bool showTimestamp;
  String smallIcon;
  num smallIconLevel;
  NotifeeAndroidStyle style;
  String tag;
  String ticker;
  num timeoutAfter;
  bool showChronometer;
  List<num> vibrationPattern;
  NotifeeAndroidVisibility visibility;
  num timestamp;

  static NotifeeAndroidNotification fromMap(Map map) {
    if (map == null) {
      return null;
    }

    return NotifeeAndroidNotification(
      actions: NotifeeAndroidAction.fromListMap(map['actions']),
      asForegroundService: map['asForegroundService'],
      autoCancel: map['autoCancel'],
      badgeIconType:
          NotifeeAndroidBadgeIconType.fromNumber(map['badgeIconType']),
      category: NotifeeAndroidCategory.fromString(map['category']),
      channelId: map['channelId'],
      // todo
      color: null,
      colorized: map['colorized'],
      chronometerDirection: map['chronometerDirection'],
      defaults: NotifeeAndroidDefaults.fromList(map['defaults']),
      groupId: map['groupId'],
      groupAlertBehaviour: NotifeeAndroidGroupAlertBehaviour.fromNumber(
          map['groupAlertBehaviour']),
      groupSummary: map['groupSummary'],
      inputHistory: map['inputHistory'],
      largeIcon: map['largeIcon'],
      lights: map['lights'],
      localOnly: map['localOnly'],
      number: map['number'],
      ongoing: map['ongoing'],
      onlyAlertOnce: map['onlyAlertOnce'],
      pressAction: NotifeeAndroidPressAction.fromMap(map['pressAction']),
      importance: NotifeeAndroidImportance.fromNumber(map['importance']),
      progress: NotifeeAndroidProgressIndicator.fromMap(map['progress']),
      showTimestamp: map['showTimestamp'],
      smallIcon: map['smallIcon'],
      smallIconLevel: map['smallIconLevel'],
      // todo style
      tag: map['tag'],
      ticker: map['ticker'],
      timeoutAfter: map['timeoutAfter'],
      showChronometer: map['showChronometer'],
      vibrationPattern: map['vibrationPattern'],
      visibility: NotifeeAndroidVisibility.fromNumber(map['visibility']),
      timestamp: map['timestamp'],
    );
  }

  NotifeeAndroidNotification({
    this.actions,
    this.asForegroundService = false,
    this.autoCancel = true,
    this.badgeIconType = NotifeeAndroidBadgeIconType.LARGE,
    this.category, // todo
    @required this.channelId,
    this.color,
    this.colorized = false,
    this.chronometerDirection = 'up',
    this.defaults = const [NotifeeAndroidDefaults.ALL],
    this.groupId,
    this.groupAlertBehaviour = NotifeeAndroidGroupAlertBehaviour.ALL,
    this.groupSummary = false,
    this.inputHistory,
    this.largeIcon,
    this.lights,
    this.localOnly = false,
    this.number,
    this.ongoing = false,
    this.onlyAlertOnce = false,
    this.pressAction,
    this.importance = NotifeeAndroidImportance.DEFAULT,
    this.progress,
    this.showTimestamp = false,
    this.smallIcon = 'ic_launcher',
    this.smallIconLevel,
    this.style,
    this.tag,
    this.ticker,
    this.timeoutAfter,
    this.showChronometer = false,
    this.vibrationPattern,
    this.visibility = NotifeeAndroidVisibility.PRIVATE,
    this.timestamp,
  }) {
    isNotNullOrEmpty('channelId', channelId);
  }

  // todo check all params
  Map build() {
    Map androidNotification = {
      'asForegroundService': asForegroundService,
      'autoCancel': autoCancel,
      'colorized': colorized,
      'channelId': channelId,
      'chronometerDirection': chronometerDirection,
      'groupSummary': groupSummary,
      'localOnly': localOnly,
      'ongoing': ongoing,
      'onlyAlertOnce': onlyAlertOnce,
      'showTimestamp': showTimestamp,
      'smallIcon': smallIcon,
      'showChronometer': showChronometer,
    };

    if (badgeIconType != null) {
      androidNotification['bagdeIconType'] = badgeIconType.value;
    }

    if (defaults != null && defaults.length > 0) {
      List defaultValues = [];
      for (NotifeeAndroidDefaults def in defaults) {
        defaultValues.add(def.value);
      }

      androidNotification['defaults'] = defaultValues;
    }

    if (groupAlertBehaviour != null) {
      androidNotification['groupAlertBehaviour'] = groupAlertBehaviour.value;
    }

    if (importance != null) {
      androidNotification['importance'] = importance.value;
    }

    if (visibility != null) {
      androidNotification['visibility'] = visibility.value;
    }

    if (actions != null && actions.length > 0) {
      List<Map> actionsList = [];

      for (NotifeeAndroidAction action in actions) {
        actionsList.add(action.build());
      }

      androidNotification['actions'] = actionsList;
    }

    if (category != null) {
      androidNotification['category'] =
          NotifeeAndroidCategory.toStringValue(category);
    }

    if (color != null) {
      androidNotification['color'] = color.stringValue;
    }

    if (groupId != null) {
      androidNotification['groupId'] = groupId;
    }

    if (lights != null) {
      assert(lights[0] == NotifeeAndroidColor,
          'index 0 of the lights member must be a NotifeeAndroidColor');
      assert(lights[1] is num && lights[1] > 0,
          'index 1 of the lights member must be a positive number');
      assert(lights[2] is num && lights[2] > 0,
          'index 2 of the lights member must be a positive number');
      androidNotification['lights'] = lights;
    }

    if (pressAction != null) {
      androidNotification['pressAction'] = pressAction.build();
    }

    if (progress != null) {
      androidNotification['progress'] = progress.build();
    }

    if (style != null) {
      Map androidStyle = style.build();

      if (androidStyle != null) {
        androidNotification['style'] = androidStyle;
      }
    }

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
