part of flutter_notifee;


class NotifeeAndroidCategory<int> extends Enum<int> {
  const NotifeeAndroidCategory(int val) : super(val);

  static NotifeeAndroidCategory fromString(String value) {
    if (value == null) {
      return null;
    }

    switch (value) {
      case 'alarm':
        return NotifeeAndroidCategory.ALARM;
      case 'call':
        return NotifeeAndroidCategory.CALL;
      case 'email':
        return NotifeeAndroidCategory.EMAIL;
      case 'error':
        return NotifeeAndroidCategory.ERROR;
      case 'event':
        return NotifeeAndroidCategory.EVENT;
      case 'msg':
        return NotifeeAndroidCategory.MESSAGE;
      case 'navigation':
        return NotifeeAndroidCategory.NAVIGATION;
      case 'progress':
        return NotifeeAndroidCategory.PROGRESS;
      case 'promp':
        return NotifeeAndroidCategory.PROMO;
      case 'recommendation':
        return NotifeeAndroidCategory.RECOMMENDATION;
      case 'reminder':
        return NotifeeAndroidCategory.REMINDER;
      case 'service':
        return NotifeeAndroidCategory.SERVICE;
      case 'social':
        return NotifeeAndroidCategory.SOCIAL;
      case 'status':
        return NotifeeAndroidCategory.STATUS;
      case 'sys':
        return NotifeeAndroidCategory.SYSTEM;
      case 'transport':
        return NotifeeAndroidCategory.TRANSPORT;
      default:
        throw 'Unkown AndroidCategory provided';
    }
  }

  static String toStringValue(NotifeeAndroidCategory category) {
    switch (category) {
      case NotifeeAndroidCategory.ALARM:
        return 'alarm';
      case NotifeeAndroidCategory.CALL:
        return 'call';
      case NotifeeAndroidCategory.EMAIL:
        return 'email';
      case NotifeeAndroidCategory.ERROR:
        return 'error';
      case NotifeeAndroidCategory.EVENT:
        return 'event';
      case NotifeeAndroidCategory.MESSAGE:
        return 'msg';
      case NotifeeAndroidCategory.NAVIGATION:
        return 'navigation';
      case NotifeeAndroidCategory.PROGRESS:
        return 'progress';
      case NotifeeAndroidCategory.PROMO:
        return 'promp';
      case NotifeeAndroidCategory.RECOMMENDATION:
        return 'recommendation';
      case NotifeeAndroidCategory.REMINDER:
        return 'reminder';
      case NotifeeAndroidCategory.SERVICE:
        return 'service';
      case NotifeeAndroidCategory.SOCIAL:
        return 'social';
      case NotifeeAndroidCategory.STATUS:
        return 'status';
      case NotifeeAndroidCategory.SYSTEM:
        return 'sys';
      case NotifeeAndroidCategory.TRANSPORT:
        return 'transport';
      default:
        throw 'Unkown AndroidCategory provided';
    }
  }

  static const NotifeeAndroidCategory ALARM = const NotifeeAndroidCategory(0);
  static const NotifeeAndroidCategory CALL = const NotifeeAndroidCategory(1);
  static const NotifeeAndroidCategory EMAIL = const NotifeeAndroidCategory(2);
  static const NotifeeAndroidCategory ERROR = const NotifeeAndroidCategory(3);
  static const NotifeeAndroidCategory EVENT = const NotifeeAndroidCategory(4);
  static const NotifeeAndroidCategory MESSAGE = const NotifeeAndroidCategory(5);
  static const NotifeeAndroidCategory NAVIGATION = const NotifeeAndroidCategory(6);
  static const NotifeeAndroidCategory PROGRESS = const NotifeeAndroidCategory(7);
  static const NotifeeAndroidCategory PROMO = const NotifeeAndroidCategory(8);
  static const NotifeeAndroidCategory RECOMMENDATION = const NotifeeAndroidCategory(9);
  static const NotifeeAndroidCategory REMINDER = const NotifeeAndroidCategory(10);
  static const NotifeeAndroidCategory SERVICE = const NotifeeAndroidCategory(11);
  static const NotifeeAndroidCategory SOCIAL = const NotifeeAndroidCategory(12);
  static const NotifeeAndroidCategory STATUS = const NotifeeAndroidCategory(13);
  static const NotifeeAndroidCategory SYSTEM = const NotifeeAndroidCategory(14);
  static const NotifeeAndroidCategory TRANSPORT = const NotifeeAndroidCategory(15);
}







//enum NotifeeAndroidCategory {
//  ALARM,
//  CALL,
//  EMAIL,
//  ERROR,
//  EVENT,
//  MESSAGE,
//  NAVIGATION,
//  PROGRESS,
//  PROMO,
//  RECOMMENDATION,
//  REMINDER,
//  SERVICE,
//  SOCIAL,
//  STATUS,
//  SYSTEM,
//  TRANSPORT,
//}
//
//String androidCategoryToString(NotifeeAndroidCategory category) {
//  if (category == null) {
//    return null;
//  }
//
//  switch (category) {
//    case NotifeeAndroidCategory.ALARM:
//      return 'alarm';
//    case NotifeeAndroidCategory.CALL:
//      return 'call';
//    case NotifeeAndroidCategory.EMAIL:
//      return 'email';
//    case NotifeeAndroidCategory.ERROR:
//      return 'error';
//    case NotifeeAndroidCategory.EVENT:
//      return 'event';
//    case NotifeeAndroidCategory.MESSAGE:
//      return 'msg';
//    case NotifeeAndroidCategory.NAVIGATION:
//      return 'navigation';
//    case NotifeeAndroidCategory.PROGRESS:
//      return 'progress';
//    case NotifeeAndroidCategory.PROMO:
//      return 'promp';
//    case NotifeeAndroidCategory.RECOMMENDATION:
//      return 'recommendation';
//    case NotifeeAndroidCategory.REMINDER:
//      return 'reminder';
//    case NotifeeAndroidCategory.SERVICE:
//      return 'service';
//    case NotifeeAndroidCategory.SOCIAL:
//      return 'social';
//    case NotifeeAndroidCategory.STATUS:
//      return 'status';
//    case NotifeeAndroidCategory.SYSTEM:
//      return 'sys';
//    case NotifeeAndroidCategory.TRANSPORT:
//      return 'transport';
//    default:
//      throw 'Unkown AndroidCategory provided';
//  }
//}
