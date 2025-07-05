import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: DrawersMobile(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: ListView(
            children: [
              //Introduction, first section
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 110.0,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/image-circle.png',
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(text: 'About me', size: 35.0),
                    const SizedBox(height: 10.0),
                    Sans(
                      text: "Hello! I'm Aman singh, a flutter developer",
                      size: 15.0,
                    ),
                    Sans(
                      text:
                          "I strive to ensure astounding performance with state of ",
                      size: 15.0,
                    ),
                    Sans(
                      text:
                          "the art security for Android, Ios, Web, Mac, Linux",
                      size: 15.0,
                    ),
                    const SizedBox(height: 15.0),
                    Wrap(
                      runSpacing: 7.0,
                      spacing: 7.0,
                      children: [
                        tealContainer('Flutter'),
                        tealContainer('Firebase'),
                        tealContainer('Android'),
                        tealContainer('Windows'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),

              //Web development, second section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: 'assets/images/webL.png',
                    width: 200.0,
                  ),
                  const SizedBox(height: 30.0),
                  SansBold(text: 'Web development', size: 20.0),
                  const SizedBox(height: 10.0),
                ],
              ),
              Sans(
                text:
                    "I'm here to build your presence online with state of the art web apps",
                size: 15.0,
              ),

              //App development, third section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: 'assets/images/app.png',
                    width: 200.0,
                    reverse: true,
                  ),
                  const SizedBox(height: 30.0),
                  SansBold(text: 'App development', size: 20.0),
                  const SizedBox(height: 10.0),
                ],
              ),
              Sans(
                text:
                    "Do you need a high-performance, responsive and beautiful app? Don't worry, I've got you covered.",
                size: 15.0,
              ),

              //Back end development, third section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: 'assets/images/firebase.png',
                    width: 200.0,
                  ),
                  const SizedBox(height: 30.0),
                  SansBold(text: 'Back-end development', size: 20.0),
                  const SizedBox(height: 10.0),
                ],
              ),
              Sans(
                text:
                    "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that.",
                size: 15.0,
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
