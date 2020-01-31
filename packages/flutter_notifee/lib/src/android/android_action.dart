part of flutter_notifee;

class NotifeeAndroidAction extends NotifeeBridge {
  NotifeeAndroidPressAction pressAction;
  String title;
  String icon;
  NotifeeAndroidInput input;

  static List<NotifeeAndroidAction> fromListMap(List listMap) {
    if (listMap == null) {
      return null;
    }

    List<NotifeeAndroidAction> list = [];

    if (listMap.isEmpty) {
      return list;
    }

    for (Map map in listMap) {
      list.add(NotifeeAndroidAction(
          title: map['title'],
          pressAction: NotifeeAndroidPressAction.fromMap(map['pressAction']),
          icon: map['icon'],
          input: NotifeeAndroidInput.fromMap(map['input'])));
    }

    return list;
  }

  NotifeeAndroidAction({
    @required this.pressAction,
    @required this.title,
    this.icon,
    this.input,
  }) {
    isNotNullOrEmpty('title', title);
    assert(pressAction != null);
  }

  Map build() {
    Map action = {
      'title': title,
      'pressAction': pressAction.build(),
    };

    if (icon != null) {
      action['icon'] = icon;
    }

    if (input != null) {
      action['input'] = input.build();
    }

    return action;
  }
}

class NotifeeAndroidPressAction extends NotifeeBridge {
  String id;
  String launchActivity;

  static NotifeeAndroidPressAction fromMap(Map map) {
    if (map == null) {
      return null;
    }

    return NotifeeAndroidPressAction(
      id: map['id'],
      launchActivity: map['launchActivity'],
    );
  }

  NotifeeAndroidPressAction({@required this.id, this.launchActivity}) {
    isNotNullOrEmpty('id', id);
  }

  Map build() {
    Map pressAction = {
      'id': id,
    };

    if (launchActivity != null) {
      pressAction['launchActivity'] = launchActivity;
    }

    return pressAction;
  }
}

class NotifeeAndroidInput extends NotifeeBridge {
  bool allowFreeFormInput;
  bool allowGeneratedReplies;
  List<String> choices;
  bool editableChoices;
  String placeholder;

  static NotifeeAndroidInput fromMap(Map map) {
    if (map == null) {
      return null;
    }

    return NotifeeAndroidInput(
      allowFreeFormInput: map['allowFreeFormInput'],
      allowGeneratedReplies: map['allowGeneratedReplies'],
      choices: map['choices'],
      editableChoices: map['editableChoices'],
      placeholder: map['placeholder'],
    );
  }

  NotifeeAndroidInput({
    this.allowFreeFormInput = true,
    this.allowGeneratedReplies = true,
    this.choices,
    this.editableChoices = false,
    this.placeholder,
  }) {
    if (!allowFreeFormInput) {
      String err =
          'while "allowFreeFormInput" is true, "choices" must have at least one choice';
      assert(choices != null, err);
      assert(choices.length == 0, err);
    }

    if (editableChoices && !allowFreeFormInput) {
      throw 'while "editableChoices" is true, "allowFreeFormInput" must also be true';
    }
  }

  Map build() {
    Map input = {
      'allowFreeFormInput': allowFreeFormInput,
      'allowGeneratedReplies': allowGeneratedReplies,
      'editableChoices': editableChoices,
    };

    if (choices != null && choices.length > 0) {
      input['choices'] = choices;
    }

    if (placeholder != null) {
      input['placeholder'] = placeholder;
    }

    return input;
  }
}
