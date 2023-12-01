//import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:awesome_notifications/awesome_notifications.dart';
//import 'package:workmanager/workmanager.dart';
import 'package:iotappsmonitoringcabai/homepage.dart';
import 'package:iotappsmonitoringcabai/mainmenu.dart';
import 'welcome_page.dart';

// Fungsi callbackDispatcher
//void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     try {
//       final response = await http.get(
//         Uri.parse("http://192.168.146.135:8080/flutterapi/iot/read.php"),
//       );
//       if (response.statusCode == 200) {
//         List<dynamic> dataList = jsonDecode(response.body);
//         if (dataList.isNotEmpty) {
//           final data = dataList.first;
//           final double parsedHumidity =
//               double.tryParse(data['value'].toString()) ?? 0.0;

//           if (parsedHumidity > 400) {
//             AwesomeNotifications().createNotification(
//               content: NotificationContent(
//                 id: 1,
//                 channelKey: "basic_channel",
//                 title: "High Humidity Alert!",
//                 body:
//                     "The humidity level has exceeded 400. Current level: $parsedHumidity%",
//               ),
//             );
//           }
//         }
//       } else {
//         print('Failed to load data with status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
//     return Future.value(true);
//   });
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelGroupKey: "basic_channel_group",
      channelKey: "basic_channel",
      channelName: "Basic Notification",
      channelDescription: "Basic notifications channel",
    )
  ], channelGroups: [
    NotificationChannelGroup(
      channelGroupKey: "basic_channel_group",
      channelGroupName: "Basic Group",
    )
  ]);
  bool isAllowedToSendNotification =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }

  // Inisialisasi Workmanager
  // await Workmanager().initialize(callbackDispatcher);
  // Pendaftaran tugas
  //Workmanager().registerPeriodicTask(
  // "1",
  //  "checkHumidity",
  // frequency: const Duration(minutes: 15),
  // Parameter lainnya jika diperlukan
  //);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const WelcomePage(),
        '/mainmenu': (context) => const MainMenu(),
        '/homepage': (context) => const HomePage(),
      },
      //home: const HomePage()
      //home: const WelcomePage(),
    );
  }
}
