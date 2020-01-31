part of flutter_notifee;

class NotifeeAndroidVisibility<int> extends Enum<int> {
  const NotifeeAndroidVisibility(int val) : super(val);

  static NotifeeAndroidVisibility fromNumber(num value) {
    if (value == null) {
      return null;
    }

    switch (value) {
      case -1:
        return NotifeeAndroidVisibility.SECRET;
      case 0:
        return NotifeeAndroidVisibility.PRIVATE;
      case 1:
        return NotifeeAndroidVisibility.PUBLIC;
      default:
        throw 'invalid NotifeeAndroidVisibility number provided';
    }
  }

  static const NotifeeAndroidVisibility SECRET =
      const NotifeeAndroidVisibility(-1);
  static const NotifeeAndroidVisibility PRIVATE =
      const NotifeeAndroidVisibility(0);
  static const NotifeeAndroidVisibility PUBLIC =
      const NotifeeAndroidVisibility(1);
}
