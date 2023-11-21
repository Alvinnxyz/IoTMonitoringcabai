// welcome_page.dart
import 'package:flutter/material.dart';
import 'package:iotappsmonitoringcabai/mainmenu.dart';
import 'homepage.dart';
import 'mainmenu.dart'; // Import HomePage

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Revitalize your green space',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20.0), // For spacing
            Expanded(
              // Container to hold the image
              child: Image.asset(
                'assets/tumbuhaniot.png', // Replace with your local image asset path
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20.0), // For spacing
            Text(
              'Grow healthy plants\nGrow a happier life',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 40.0), // For spacing
            ElevatedButton(
              child: const Text('Go'),
              onPressed: () {
                // Navigate to HomePage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainMenu()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
