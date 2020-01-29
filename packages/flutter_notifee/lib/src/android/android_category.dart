part of flutter_notifee;

enum NotifeeAndroidCategory {
  ALARM,
  CALL,
  EMAIL,
  ERROR,
  EVENT,
  MESSAGE,
  NAVIGATION,
  PROGRESS,
  PROMO,
  RECOMMENDATION,
  REMINDER,
  SERVICE,
  SOCIAL,
  STATUS,
  SYSTEM,
  TRANSPORT,
}

String androidCategoryToString(NotifeeAndroidCategory category) {
  if (category == null) {
    return null;
  }

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
