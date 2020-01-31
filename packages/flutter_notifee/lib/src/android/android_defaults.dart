part of flutter_notifee;

class NotifeeAndroidDefaults<int> extends Enum<int> {
  const NotifeeAndroidDefaults(int val) : super (val);

  static List<NotifeeAndroidDefaults> fromList(List list) {
    List<NotifeeAndroidDefaults> defaults = [];

    if (list == null) {
      return defaults;
    }

    for (num i in list) {
      switch (i) {
        case -1:
          defaults.add(NotifeeAndroidDefaults.ALL);
          break;
        case 1:
          defaults.add(NotifeeAndroidDefaults.SOUND);
          break;
        case 2:
          defaults.add(NotifeeAndroidDefaults.VIBRATE);
          break;
        case 4:
          defaults.add(NotifeeAndroidDefaults.LIGHTS);
          break;
        default:
          throw 'invalid NotifeeAndroidDefaults number provided';
      }
    }

    return defaults;
  }

  static const NotifeeAndroidDefaults ALL = const NotifeeAndroidDefaults(-1);
  static const NotifeeAndroidDefaults LIGHTS = const NotifeeAndroidDefaults(4);
  static const NotifeeAndroidDefaults SOUND = const NotifeeAndroidDefaults(1);
  static const NotifeeAndroidDefaults VIBRATE = const NotifeeAndroidDefaults(2);
}