import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:iotappsmonitoringcabai/notification_controller.dart';
import 'package:iotappsmonitoringcabai/theme.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double humidity = 0.0; // Placeholder for humidity value

  Future<void> _getdata() async {
    try {
      final response = await http.get(
        Uri.parse("http://192.168.146.135:8080/flutterapi/iot/read.php"),
      );
      if (response.statusCode == 200) {
        List<dynamic> dataList = jsonDecode(response.body);
        if (dataList.isNotEmpty) {
          final data = dataList.first;
          final double parsedHumidity =
              double.tryParse(data['value'].toString()) ?? 0.0;
          setState(() {
            humidity = parsedHumidity;
          });

          // Check if humidity is greater than 400 and trigger notification
          if (humidity > 400) {
            AwesomeNotifications().createNotification(
              content: NotificationContent(
                id: 1,
                channelKey: "basic_channel",
                title: "Tumbuhan kamu butuh air!!!",
                body:
                    "Skor kelembapan dibawah 400 :(  Kelembapan saat ini: $humidity%",
              ),
            );
          }
        }
      } else {
        throw Exception(
            'Failed to load data with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    super.initState();

    _getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Monitoring Tanaman Cabai",
            style: blackTextStyle.copyWith(
              fontSize: 18,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DateFormat('EEEE, dd MMMM yyyy ')
                  .format(DateTime.now()), // Format the current date and time
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
                'assets/lombok.png'), // Replace with actual image asset path
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '${humidity.toStringAsFixed(0)}%', // Humidity displayed as a whole number
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              "Humidity",
              style: greyTextStyle.copyWith(
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AwesomeNotifications().createNotification(
            content: NotificationContent(
                id: 1,
                channelKey: "basic_channel",
                title: "Hello world!",
                body: "Yay! I have local notifications working now!"),
          );
        },
        child: const Icon(
          Icons.notification_add,
        ),
      ),
    );
  }
}
