import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_notifee/flutter_notifee.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> onPress() async {
    await Notifee.createChannel(NotifeeAndroidChannel(
      id: 'high',
      name: 'High channel!',
    ));

    await Notifee.displayNotification(NotifeeNotification(
        title: 'Hello Flutter',
        body: 'Notification via Flutter SDK!!!',
        android: NotifeeAndroidNotification(
            channelId: 'high',
            color: NotifeeAndroidColor(
              hexadecimal: '#3f51b5',
            )
        )));
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
          child: (
              Text('Display Notification')
          ),
        ),
      ),
    );
  }
}
