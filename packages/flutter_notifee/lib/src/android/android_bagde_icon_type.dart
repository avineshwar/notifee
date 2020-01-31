part of flutter_notifee;

class NotifeeAndroidBadgeIconType<int> extends Enum<int> {
  const NotifeeAndroidBadgeIconType(int val) : super(val);

  static NotifeeAndroidBadgeIconType fromNumber(num value) {
    if (value == null) {
      return null;
    }

    switch (value) {
      case 0:
        return NotifeeAndroidBadgeIconType.NONE;
      case 1:
        return NotifeeAndroidBadgeIconType.SMALL;
      case 2:
        return NotifeeAndroidBadgeIconType.LARGE;
      default:
        throw 'Invalid number provided for NotifeeAndroidBadgeIconType';
    }
  }

  static const NotifeeAndroidBadgeIconType NONE =
      const NotifeeAndroidBadgeIconType(0);
  static const NotifeeAndroidBadgeIconType SMALL =
      const NotifeeAndroidBadgeIconType(1);
  static const NotifeeAndroidBadgeIconType LARGE =
      const NotifeeAndroidBadgeIconType(2);
}
