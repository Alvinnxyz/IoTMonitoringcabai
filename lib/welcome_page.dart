// welcome_page.dart
import 'package:flutter/material.dart';
//import 'package:iotappsmonitoringcabai/mainmenu.dart';
import 'package:iotappsmonitoringcabai/widgets/button.dart';
import 'theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/onboard.png',
              height: 331,
              width: 288.3,
            ),
            const SizedBox(height: 80),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Revitalize your\ngreen space',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semibold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    'Grow healthy plants\nGrow a happier life',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      CustomFilledButton(
                        title: 'Go',
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/mainmenu', (route) => false);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
