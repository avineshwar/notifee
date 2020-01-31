import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_notifee/flutter_notifee.dart';

void main() async {
  await Notifee.onBackgroundEvent((e) {
    print('onBackgroundEvent');
  });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  StreamController<NotifeeEvent> onEvent = Notifee.onForegroundEvent();

  @override
  void initState() {
    super.initState();
    onEvent.stream.listen((event) {
      print(event.type);
    });
  }

  @override
  void dispose() {
    onEvent.close();
    super.dispose();
  }

  Future<void> openSettings() async {
    await Notifee.openNotificationSettings();
  }

  Future<void> onPress() async {
    NotifeeInitialNotification initialNotification =
        await Notifee.getInitialNotification();

    if (initialNotification != null) {
      print(initialNotification.notification.id);
      print(initialNotification.androidPressAction.id);
    }

    await Notifee.createChannelGroup(NotifeeAndroidChannelGroup(
      id: 'group',
      name: 'Group!',
    ));

    await Notifee.deleteChannel('high');

    await Notifee.createChannel(NotifeeAndroidChannel(
      id: 'high',
      name: 'High channel!',
      importance: NotifeeAndroidImportance.HIGH,
      groupId: 'group',
    ));

    NotifeeAndroidChannel channel = await Notifee.getChannel('high');

    await Notifee.displayNotification(NotifeeNotification(
        title: 'Hello Flutter',
        body: 'Notification via Flutter SDK!!!',
        android: NotifeeAndroidNotification(
            channelId: 'high',
            color: NotifeeAndroidColor.AQUA,
//            color: NotifeeAndroidColor.hexadecimal('#000000'),
            defaults: [
              NotifeeAndroidDefaults.LIGHTS,
              NotifeeAndroidDefaults.SOUND
            ],
            style: NotifeeAndroidStyle(
                bigPictureStyle: NotifeeAndroidBigPictureStyle(
              picture:
                  'https://images.unsplash.com/photo-1533552755457-5b471cb2ab11?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
              title: 'Big Picture Style!',
              summary: 'In Flutter!',
            )),
            actions: [
              NotifeeAndroidAction(
                  title: 'Press me',
                  pressAction: NotifeeAndroidPressAction(
                      id: 'woop', launchActivity: 'default'),
              )
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: RaisedButton(
          onPressed: onPress,
          child: (Text('Display Notification')),
        ),
      ),
    );
  }
}
