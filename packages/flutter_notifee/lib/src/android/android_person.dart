part of flutter_notifee;

class NotifeeAndroidPerson extends NotifeeBridge {
  String name;
  String id;
  bool bot;
  bool important;
  String uri;

  NotifeeAndroidPerson({
    @required this.name,
    this.id,
    this.bot = false,
    this.important = false,
    this.uri,
  }) {
    isNotNullOrEmpty('name', name);
  }

  Map build() {
    Map person = {
      'name': name,
      'bot': bot,
      'important': important,
    };

    if (id != null) {
      person['id'] = id;
    }

    if (uri != null) {
      person['uri'] = uri;
    }

    return person;
  }
}