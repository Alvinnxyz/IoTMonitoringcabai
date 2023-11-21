import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        // We expect the JSON to be a List
        List<dynamic> dataList = jsonDecode(response.body);
        if (dataList.isNotEmpty) {
          // Get the first item in the list
          final data = dataList.first;
          final double parsedHumidity =
              double.tryParse(data['value'].toString()) ?? 0.0;
          setState(() {
            humidity = parsedHumidity;
          });
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
    _getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monitoring Tanaman Cabai"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Monday, 20th November", // Dynamic date can be placed here
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
                'assets/lombok.png'), // Replace with actual image asset path
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${humidity.toStringAsFixed(0)}%', // Humidity displayed as a whole number
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Text(
            "Humidity",
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
