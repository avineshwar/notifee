part of flutter_notifee;

class NotifeeAndroidImportance<int> extends Enum<int> {
  const NotifeeAndroidImportance(int val) : super(val);

  static NotifeeAndroidImportance fromNumber(num value) {
    if (value == null) {
      return null;
    }

    switch (value) {
      case 0:
        return NotifeeAndroidImportance.NONE;
      case 1:
        return NotifeeAndroidImportance.MIN;
      case 2:
        return NotifeeAndroidImportance.LOW;
      case 3:
        return NotifeeAndroidImportance.DEFAULT;
      case 4:
        return NotifeeAndroidImportance.HIGH;
      default:
        throw 'invalid NotifeeAndroidImportance number provided';
    }
  }

  static const NotifeeAndroidImportance NONE =
      const NotifeeAndroidImportance(0);
  static const NotifeeAndroidImportance MIN = const NotifeeAndroidImportance(1);
  static const NotifeeAndroidImportance LOW = const NotifeeAndroidImportance(2);
  static const NotifeeAndroidImportance DEFAULT =
      const NotifeeAndroidImportance(3);
  static const NotifeeAndroidImportance HIGH =
      const NotifeeAndroidImportance(4);
}
