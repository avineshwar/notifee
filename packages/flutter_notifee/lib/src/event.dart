part of flutter_notifee;

class NotifeeEvent {
  NotifeeEventType type;
  NotifeeNotification notification;
  NotifeeNativeAndroidChannel androidChannel;
  NotifeeNativeAndroidChannelGroup androidChannelGroup;
  NotifeeAndroidPressAction pressAction;
  String input;
  bool blocked;

  NotifeeEvent({
    @required this.type,
    this.notification,
    this.androidChannel,
    this.androidChannelGroup,
    this.blocked,
    this.pressAction,
    this.input,
  });
}

class NotifeeEventType<int> extends Enum<int> {
  const NotifeeEventType(int val) : super(val);

  static NotifeeEventType fromNumber(num value) {
    switch (value) {
      case -1:
        return NotifeeEventType.UNKNOWN;
      case 0:
        return NotifeeEventType.DISMISSED;
      case 1:
        return NotifeeEventType.PRESS;
      case 2:
        return NotifeeEventType.ACTION_PRESS;
      case 3:
        return NotifeeEventType.DELIVERED;
      case 4:
        return NotifeeEventType.APP_BLOCKED;
      case 5:
        return NotifeeEventType.CHANNEL_BLOCKED;
      case 6:
        return NotifeeEventType.CHANNEL_GROUP_BLOCKED;
      default:
        throw 'Unknown NotifeeEventType provided';
    }
  }

  static const NotifeeEventType UNKNOWN = const NotifeeEventType(-1);
  static const NotifeeEventType DISMISSED = const NotifeeEventType(0);
  static const NotifeeEventType PRESS = const NotifeeEventType(1);
  static const NotifeeEventType ACTION_PRESS = const NotifeeEventType(2);
  static const NotifeeEventType DELIVERED = const NotifeeEventType(3);
  static const NotifeeEventType APP_BLOCKED = const NotifeeEventType(4);
  static const NotifeeEventType CHANNEL_BLOCKED = const NotifeeEventType(5);
  static const NotifeeEventType CHANNEL_GROUP_BLOCKED =
      const NotifeeEventType(6);
}
