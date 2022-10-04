import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  static Future _initializetimezone() async {
    tz.initializeTimeZones();
  }

  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    var inializingAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var inializingSettings = InitializationSettings(android: inializingAndroid);
    _flutterLocalNotificationsPlugin.initialize(inializingSettings);
    await _initializetimezone();
  }

  static Future<void> deleteNotification({required int id}) async {
    await _flutterLocalNotificationsPlugin.cancel(id).then((value) {
      if (kDebugMode) {
        print('deleted');
      }
    });
  }

  static Future<void> sheduleNotification({
    required String title,
    required String body,
    required DateTime dateTime,
  }) async {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      "Tasks",
      'Tasks App',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
      priority: Priority.high,
    );
    final date = tz.TZDateTime.from(dateTime, tz.local);
    var plat = NotificationDetails(android: androidNotificationDetails);
    print(date);
    print(date.millisecondsSinceEpoch.toString().substring(4));
    _flutterLocalNotificationsPlugin.zonedSchedule(int.parse(date.millisecondsSinceEpoch.toString().substring(4)), "ToDo : ${dateTime.toString()}}", body, date, plat,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, androidAllowWhileIdle: true);
  }

  static Future<void> show({required String title, required String body, required DateTime dateTime, required TimeOfDay time}) async {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      "Tasks",
      'Tasks App',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
      priority: Priority.high,
    );
    // final date = tz.TZDateTime.local(dateTime.year, dateTime.month, dateTime.day, time.hour, time.minute);
    var plat = NotificationDetails(android: androidNotificationDetails);
    // print(date);
    _flutterLocalNotificationsPlugin.show(
      0,
      "ToDo : ${dateTime.toString().substring(0, 10)} ${time.toString()}",
      body,
      plat,
    );
  }
}
