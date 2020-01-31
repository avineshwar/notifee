part of flutter_notifee;

class NotifeeAndroidColor<int> extends Enum<int> {
  const NotifeeAndroidColor(int val) : super (val);

//  static Map<num, String> HEX_MAP = {};

  static const NotifeeAndroidColor HEX = const NotifeeAndroidColor(-1);
  static const NotifeeAndroidColor RED = const NotifeeAndroidColor(0);
  static const NotifeeAndroidColor BLUE = const NotifeeAndroidColor(1);
  static const NotifeeAndroidColor GREEN = const NotifeeAndroidColor(2);
  static const NotifeeAndroidColor BLACK = const NotifeeAndroidColor(3);
  static const NotifeeAndroidColor WHITE = const NotifeeAndroidColor(4);
  static const NotifeeAndroidColor CYAN = const NotifeeAndroidColor(5);
  static const NotifeeAndroidColor MAGENTA = const NotifeeAndroidColor(6);
  static const NotifeeAndroidColor YELLOW = const NotifeeAndroidColor(7);
  static const NotifeeAndroidColor LIGHTGRAY = const NotifeeAndroidColor(8);
  static const NotifeeAndroidColor DARKGRAY = const NotifeeAndroidColor(9);
  static const NotifeeAndroidColor GRAY = const NotifeeAndroidColor(10);
  static const NotifeeAndroidColor LIGHTGREY = const NotifeeAndroidColor(11);
  static const NotifeeAndroidColor DARKGREY = const NotifeeAndroidColor(12);
  static const NotifeeAndroidColor AQUA = const NotifeeAndroidColor(13);
  static const NotifeeAndroidColor FUCHSIA = const NotifeeAndroidColor(14);
  static const NotifeeAndroidColor LIME = const NotifeeAndroidColor(15);
  static const NotifeeAndroidColor MAROON = const NotifeeAndroidColor(16);
  static const NotifeeAndroidColor NAVY = const NotifeeAndroidColor(17);
  static const NotifeeAndroidColor OLIVE = const NotifeeAndroidColor(18);
  static const NotifeeAndroidColor PURPLE = const NotifeeAndroidColor(18);
  static const NotifeeAndroidColor SILVER = const NotifeeAndroidColor(20);
  static const NotifeeAndroidColor TEAL = const NotifeeAndroidColor(21);

//  static NotifeeAndroidColor hexadecimal(String hex) {
//    // todo validate
//    HEX_MAP[id] = hex;
//
//    return NotifeeAndroidColor.HEX;
//  }

  static NotifeeAndroidColor fromString(String value) {
    switch (value) {
      case 'RED':
        return NotifeeAndroidColor.RED;
      case 'BLUE':
        return NotifeeAndroidColor.BLUE;
      case 'GREEN':
        return NotifeeAndroidColor.GREEN;
      case 'BLACK':
        return NotifeeAndroidColor.BLACK;
      case 'WHITE':
        return NotifeeAndroidColor.WHITE;
      case 'CYAN':
        return NotifeeAndroidColor.CYAN;
      case 'MAGENTA':
        return NotifeeAndroidColor.MAGENTA;
      case 'YELLOW':
        return NotifeeAndroidColor.YELLOW;
      case 'LIGHTGRAY':
        return NotifeeAndroidColor.LIGHTGRAY;
      case 'DARKGRAY':
        return NotifeeAndroidColor.DARKGRAY;
      case 'GRAY':
        return NotifeeAndroidColor.GRAY;
      case 'LIGHTGREY':
        return NotifeeAndroidColor.LIGHTGREY;
      case 'DARKGREY':
        return NotifeeAndroidColor.DARKGREY;
      case 'AQUA':
        return NotifeeAndroidColor.AQUA;
      case 'FUCHSIA':
        return NotifeeAndroidColor.FUCHSIA;
      case 'LIME':
        return NotifeeAndroidColor.LIME;
      case 'MAROON':
        return NotifeeAndroidColor.MAROON;
      case 'NAVY':
        return NotifeeAndroidColor.NAVY;
      case 'OLIVE':
        return NotifeeAndroidColor.OLIVE;
      case 'PURPLE':
        return NotifeeAndroidColor.PURPLE;
      case 'SILVER':
        return NotifeeAndroidColor.SILVER;
      case 'TEAL':
        return NotifeeAndroidColor.TEAL;
      default:
        return NotifeeAndroidColor.HEX;
    }
  }

  String get stringValue {
    switch (this) {
//      case NotifeeAndroidColor.HEX:
//        return hex ?? '#000000';
      case NotifeeAndroidColor.RED:
        return 'RED';
      case NotifeeAndroidColor.BLUE:
        return 'BLUE';
      case NotifeeAndroidColor.GREEN:
        return 'GREEN';
      case NotifeeAndroidColor.BLACK:
        return 'BLACK';
      case NotifeeAndroidColor.WHITE:
        return 'WHITE';
      case NotifeeAndroidColor.CYAN:
        return 'CYAN';
      case NotifeeAndroidColor.MAGENTA:
        return 'MAGENTA';
      case NotifeeAndroidColor.YELLOW:
        return 'YELLOW';
      case NotifeeAndroidColor.LIGHTGRAY:
        return 'LIGHTGRAY';
      case NotifeeAndroidColor.DARKGRAY:
        return 'DARKGRAY';
      case NotifeeAndroidColor.GRAY:
        return 'GRAY';
      case NotifeeAndroidColor.LIGHTGREY:
        return 'LIGHTGREY';
      case NotifeeAndroidColor.DARKGREY:
        return 'DARKGREY';
      case NotifeeAndroidColor.AQUA:
        return 'AQUA';
      case NotifeeAndroidColor.FUCHSIA:
        return 'FUCHSIA';
      case NotifeeAndroidColor.LIME:
        return 'LIME';
      case NotifeeAndroidColor.MAROON:
        return 'MAROON';
      case NotifeeAndroidColor.NAVY:
        return 'NAVY';
      case NotifeeAndroidColor.OLIVE:
        return 'OLIVE';
      case NotifeeAndroidColor.PURPLE:
        return 'PURPLE';
      case NotifeeAndroidColor.SILVER:
        return 'SILVER';
      case NotifeeAndroidColor.TEAL:
        return 'TEAL';
      default:
        throw 'Unkown AndroidColor provided';
    }
  }
}
