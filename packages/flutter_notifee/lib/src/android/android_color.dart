part of flutter_notifee;

class NotifeeAndroidColor {
  NotifeeAndroidColors color;
  String hexadecimal;

  NotifeeAndroidColor({
    this.color,
    this.hexadecimal
  }) {
    if (color == null && hexadecimal == null) {
      throw 'must provide a NotifeeAndroidColors value or hexadecimal color';
    }
  }

  String toString() {
    if (hexadecimal != null) {
      return hexadecimal;
    }

    return androidColorToString(color);
  }
}

enum NotifeeAndroidColors {
  RED,
  BLUE,
  GREEN,
  BLACK,
  WHITE,
  CYAN,
  MAGENTA,
  YELLOW,
  LIGHTGRAY,
  DARKGRAY,
  GRAY,
  LIGHTGREY,
  DARKGREY,
  AQUA,
  FUCHSIA,
  LIME,
  MAROON,
  NAVY,
  OLIVE,
  PURPLE,
  SILVER,
  TEAL,
}

String androidColorToString(NotifeeAndroidColors color) {
  if (color == null) {
    return null;
  }

  switch (color) {
    case NotifeeAndroidColors.RED:
      return 'RED';
    case NotifeeAndroidColors.BLUE:
      return 'BLUE';
    case NotifeeAndroidColors.GREEN:
      return 'GREEN';
    case NotifeeAndroidColors.BLACK:
      return 'BLACK';
    case NotifeeAndroidColors.WHITE:
     return 'WHITE';
    case NotifeeAndroidColors.CYAN:
     return 'CYAN';
    case NotifeeAndroidColors.MAGENTA:
     return 'MAGENTA';
    case NotifeeAndroidColors.YELLOW:
     return 'YELLOW';
    case NotifeeAndroidColors.LIGHTGRAY:
     return 'LIGHTGRAY';
    case NotifeeAndroidColors.DARKGRAY:
     return 'DARKGRAY';
    case NotifeeAndroidColors.GRAY:
     return 'GRAY';
    case NotifeeAndroidColors.LIGHTGREY:
     return 'LIGHTGREY';
    case NotifeeAndroidColors.DARKGREY:
     return 'DARKGREY';
    case NotifeeAndroidColors.AQUA:
     return 'AQUA';
    case NotifeeAndroidColors.FUCHSIA:
     return 'FUCHSIA';
    case NotifeeAndroidColors.LIME:
     return 'LIME';
    case NotifeeAndroidColors.MAROON:
     return 'MAROON';
    case NotifeeAndroidColors.NAVY:
     return 'NAVY';
    case NotifeeAndroidColors.OLIVE:
     return 'OLIVE';
    case NotifeeAndroidColors.PURPLE:
     return 'PURPLE';
    case NotifeeAndroidColors.SILVER:
     return 'SILVER';
    case NotifeeAndroidColors.TEAL:
     return 'TEAL';
    default:
      throw 'Unkown AndroidColor provided';
  }
}
