import 'package:clock_notifications/notification_service.dart';
import 'package:clock_notifications/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotifyService().initNotification();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  NotificationsServices notificationsServices = NotificationsServices();
  //NotificationsServices notifyServices = NotifyService();

  @override
  void initState() {
    super.initState();
    //notificationsServices.initialiseNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              notificationsServices.sendNotification("Hello World", "Good Morning");
            }, child: Text("Send Notification")),
            ElevatedButton(onPressed: (){
              notificationsServices.scheduleNotification("Hello World", "This is a very good day");
            }, child: Text("Schedule Notification")),
            ElevatedButton(onPressed: (){
              notificationsServices.stopNotifications();
            }, child: Text("Stop Notification")),
            ElevatedButton(onPressed: (){
              NotifyService().showNotification(title: "Hello World", body: 'It Works');
            }, child: Text("Button Press")),
            DatePickerTxt(),
            ScheduleBtn(),
          ],
        ),
      )
    );
  }
}


