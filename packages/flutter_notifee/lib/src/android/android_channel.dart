part of flutter_notifee;

class NotifeeAndroidChannel extends NotifeeBridge {
  String id;
  String name;
  bool badge = true;
  bool bypassDnd = false;
  String description;
  bool lights = true;
  bool vibration = true;
  String groupId;
  NotifeeAndroidImportance importance;
  String sound;

  NotifeeAndroidChannel({
    @required this.id,
    @required this.name,
    this.badge = true,
    this.bypassDnd = true,
    this.description,
    this.lights = true,
    this.vibration = true,
    this.groupId,
    this.importance = NotifeeAndroidImportance.DEFAULT,
    // lightColor
    // visibility
    // vibrationPattern
    this.sound,
  });

  Map build() {
    isNotNullOrEmpty('id', id);
    isNotNullOrEmpty('name', name);

    Map channelMap = {
      'id': id,
      'name': name,
      'badge': badge,
      'bypassDnd': bypassDnd,
      'lights': lights,
      'vibration': vibration,
    };

    if (description != null) channelMap['description'] = description;
    if (groupId != null) channelMap['groupId'] = groupId;
    if (sound != null) channelMap['sound'] = sound;
    if (importance != null) channelMap['importance'] = importance.value;

    return channelMap;
  }
}

class NotifeeNativeAndroidChannel extends NotifeeAndroidChannel {
  bool blocked;

  static NotifeeNativeAndroidChannel fromMap(Map map) {
    return NotifeeNativeAndroidChannel(
      id: map['id'],
      name: map['name'],
      badge: map['badge'],
      bypassDnd: map['bypassDnd'],
      description: map['description'],
      lights: map['lights'],
      groupId: map['groupId'],
      sound: map['sound'],
      blocked: map['blocked'],
    );
  }

  NotifeeNativeAndroidChannel({
    @required String id,
    @required String name,
    bool badge = true,
    bool bypassDnd = true,
    String description,
    bool lights = true,
    bool vibration = true,
    String groupId,
    // importance
    // lightColor
    // visibility
    // vibrationPattern
    String sound,
    this.blocked = false,
  }) : super(
            id: id,
            name: name,
            badge: badge,
            bypassDnd: bypassDnd,
            description: description,
            lights: lights,
            vibration: vibration,
            groupId: groupId,
            sound: sound);

  Map build() {
    Map channelMap = super.build();
    channelMap['blocked'] = blocked;
    return channelMap;
  }
}
