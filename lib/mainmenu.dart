import 'package:flutter/material.dart';
import 'package:iotappsmonitoringcabai/widgets/tips.dart';
import 'package:iotappsmonitoringcabai/widgets/tumbuhanitem.dart';

import 'theme.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          buildProfile(context),
          buildServices(context),
          buildFriendlyTips(),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Alvin',
                style: signinTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Explore through your plants',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semibold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pilih Tumbuhan",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              )),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                iconUrl: 'assets/lombok.png',
                title: 'Lombok',
                onTap: () {
                  Navigator.pushNamed(context, '/homepage');
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/cactus.png',
                title: 'Kaktus',
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/sunflower.png',
                title: 'Sunflower',
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/jb.png',
                title: 'Monstera',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(
        top: 50,
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Friendly Tips",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semibold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            spacing: 17,
            runSpacing: 18,
            children: [
              HomeTipsItem(
                imageUrl: 'assets/tips1.jpg',
                title: 'Tips terbaik untuk\nmenanam cabai',
                url:
                    'https://mediaindonesia.com/humaniora/571822/ini-cara-menanam-cabai-dari-biji-di-rumah',
              ),
              HomeTipsItem(
                imageUrl: 'assets/tips2.jpg',
                title: 'Tumbuhan lebat\nhati senang',
                url:
                    'https://bibitbunga.com/cara-membuat-tanaman-cepat-berbuah/',
              ),
              HomeTipsItem(
                imageUrl: 'assets/tips3.jpg',
                title: 'Tumbuhan sehat\nterbebas dari hama',
                url:
                    'https://indihome.co.id/blog/lindungi-tanaman-kesayangan-dari-hama-dengan-ikuti-10-cara-berikut-ini',
              ),
              HomeTipsItem(
                imageUrl: 'assets/tips4.jpg',
                title: 'Membuat pupuk\norganik yuk!',
                url:
                    'https://distan.bulelengkab.go.id/informasi/detail/artikel/cara-membuat-pupuk-organik-18',
              ),
            ],
          )
        ],
      ),
    );
  }
}
