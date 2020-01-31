part of flutter_notifee;

class NotifeeAndroidGroupAlertBehaviour<int> extends Enum<int> {
  const NotifeeAndroidGroupAlertBehaviour(int val) : super(val);

  static NotifeeAndroidGroupAlertBehaviour fromNumber(num value) {
    if (value == null) {
      return null;
    }

    switch (value) {
      case 0:
        return NotifeeAndroidGroupAlertBehaviour.ALL;
      case 1:
        return NotifeeAndroidGroupAlertBehaviour.SUMMARY;
      case 2:
        return NotifeeAndroidGroupAlertBehaviour.CHILDREN;
      default:
        throw 'invalid NotifeeAndroidGroupAlertBehaviour number provided';
    }
  }

  static const NotifeeAndroidGroupAlertBehaviour ALL =
      const NotifeeAndroidGroupAlertBehaviour(0);
  static const NotifeeAndroidGroupAlertBehaviour SUMMARY =
      const NotifeeAndroidGroupAlertBehaviour(1);
  static const NotifeeAndroidGroupAlertBehaviour CHILDREN =
      const NotifeeAndroidGroupAlertBehaviour(2);
}
