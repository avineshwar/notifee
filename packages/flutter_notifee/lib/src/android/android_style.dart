part of flutter_notifee;

class NotifeeAndroidStyle extends NotifeeBridge {
  NotifeeAndroidBigTextStyle bigTextStyle;
  NotifeeAndroidBigPictureStyle bigPictureStyle;
  NotifeeAndroidInboxStyle inboxStyle;
  NotifeeAndroidMessagingStyle messagingStyle;

  NotifeeAndroidStyle({
    this.bigTextStyle,
    this.bigPictureStyle,
    this.inboxStyle,
    this.messagingStyle,
  });

  Map build() {
    if (bigTextStyle != null) {
      return bigTextStyle.build();
    }

    if (bigPictureStyle != null) {
      return bigPictureStyle.build();
    }

    if (inboxStyle != null) {
      return inboxStyle.build();
    }

    if (messagingStyle != null) {
      return messagingStyle.build();
    }

    return null;
  }
}

class NotifeeAndroidBigTextStyle extends NotifeeBridge {
  String text;
  String title;
  String summary;

  NotifeeAndroidBigTextStyle({
    @required this.text,
    this.title,
    this.summary,
  }) {
    isNotNullOrEmpty('text', text);
  }

  Map build() {
    Map style = {
      'text': text,
    };

    if (title != null) {
      style['title'] = title;
    }

    if (summary != null) {
      style['summary'] = summary;
    }

    return style;
  }
}

class NotifeeAndroidBigPictureStyle extends NotifeeBridge {
  String picture;
  String title;
  String summary;
  String largeIcon;

  NotifeeAndroidBigPictureStyle({
    @required this.picture,
    this.title,
    this.summary,
    this.largeIcon,
  }) {
    isNotNullOrEmpty('picture', picture);
  }

  Map build() {
    Map style = {
      'picture': picture,
    };

    if (title != null) {
      style['title'] = title;
    }

    if (summary != null) {
      style['summary'] = summary;
    }

    if (largeIcon != null) {
      style['largeIcon'] = largeIcon;
    }

    return style;
  }
}

class NotifeeAndroidInboxStyle extends NotifeeBridge {
  List<String> lines;
  String title;
  String summary;

  NotifeeAndroidInboxStyle({
    @required this.lines,
    this.title,
    this.summary,
  }) {
    assert(lines != null);
    assert(lines.length > 0);
  }

  Map build() {
    Map style = {
      'lines': lines,
    };

    if (title != null) {
      style['title'] = title;
    }

    if (summary != null) {
      style['summary'] = summary;
    }

    return style;
  }
}

class NotifeeAndroidMessagingStyle extends NotifeeBridge {
  NotifeeAndroidPerson person;
  List<NotifeeAndroidMessagingStyleMessage> messages;
  String title;
  bool group;

  NotifeeAndroidMessagingStyle({
    @required this.person,
    @required this.messages,
    this.title,
    this.group = false,
  }) {
    assert(person != null);
    assert(messages != null);
  }

  Map build() {
    Map style = {
      'person': person.build(),
      'group': group,
    };

    List<Map> messagesList = [];
    for (NotifeeAndroidMessagingStyleMessage msg in messages) {
      messagesList.add(msg.build());
    }
    style['messages'] = messagesList;

    if (title != null) {
      style['title'] = title;
    }

    return style;
  }
}

class NotifeeAndroidMessagingStyleMessage extends NotifeeBridge {
  String text;
  num timestamp;
  NotifeeAndroidPerson person;

  NotifeeAndroidMessagingStyleMessage({
    @required this.text,
    @required this.timestamp,
    this.person,
  }) {
    isNotNullOrEmpty('text', text);
    assert(timestamp != null);
    assert(timestamp > 0);
  }

  Map build() {
    Map msg = {
      'text': text,
      'timestamp': timestamp,
    };

    if (person != null) {
      msg['person'] = person.build();
    }

    return msg;
  }
}