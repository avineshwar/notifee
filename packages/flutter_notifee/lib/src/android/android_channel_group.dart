part of flutter_notifee;

class NotifeeAndroidChannelGroup extends NotifeeBridge {
  String id;
  String name;
  String description;

  NotifeeAndroidChannelGroup({
    @required this.id,
    @required this.name,
    this.description,
  });

  Map build() {
    isNotNullOrEmpty('id', id);
    isNotNullOrEmpty('name', name);

    Map channelGroupMap = {
      'id': id,
      'name': name,
    };

    if (description != null) channelGroupMap['description'] = description;

    return channelGroupMap;
  }
}

class NotifeeNativeAndroidChannelGroup extends NotifeeAndroidChannelGroup {
  bool blocked;

  static NotifeeNativeAndroidChannelGroup fromMap(Map map) {
    return NotifeeNativeAndroidChannelGroup(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      blocked: map['blocked'],
    );
  }

  NotifeeNativeAndroidChannelGroup({
    @required String id,
    @required String name,
    String description,
    this.blocked = false,
  }) : super(id: id, name: name, description: description);
}
