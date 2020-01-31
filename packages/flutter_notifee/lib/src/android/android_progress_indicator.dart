part of flutter_notifee;

class NotifeeAndroidProgressIndicator extends NotifeeBridge {
  bool indeterminate;
  num max;
  num current;

  static NotifeeAndroidProgressIndicator fromMap(Map map) {
    if (map == null) {
      return null;
    }

    return NotifeeAndroidProgressIndicator(
      indeterminate: map['indeterminate'],
      max: map['max'],
      current: map['current'],
    );
  }

  NotifeeAndroidProgressIndicator(
      {this.indeterminate = false, this.max = 0, this.current = 0}) {
    assert(max >= current,
        'max value must be greater or equal to the current value');
  }

  Map build() {
    return {
      'indeterminate': indeterminate,
      'max': max,
      'current': current,
    };
  }
}
