import 'package:aman_singh/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/web.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: DrawersMobile(),
        body: ListView(
          children: [
            //Intro, First section
            CircleAvatar(
              radius: 117,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 110.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/image-circle.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: SansBold(text: 'Hello I\'m', size: 15.0),
                      ),
                      SansBold(text: 'Aman singh', size: 40.0),
                      Sans(text: 'Flutter developer', size: 20.0),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 3.0,
                        children: [
                          Icon(Icons.email),
                          Icon(Icons.call),
                          Icon(Icons.location_pin),
                        ],
                      ),
                      SizedBox(width: 40.0),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: [
                          Sans(text: 'amanrawat6767@gmail.com', size: 15.0),
                          Sans(text: '+91 7618447467', size: 15.0),
                          Sans(
                            text: 'Sewla Kalna chandrabani Road D.dun',
                            size: 15.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 90.0),

            //About me, Second section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold(text: 'About me', size: 35.0),
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
                    text: "the art security for Android, Ios, Web, Mac, Linux",
                    size: 15.0,
                  ),
                  const SizedBox(height: 10.0),
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
            const SizedBox(height: 60.0),

            //Third section What I do?
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SansBold(text: 'What I do? ', size: 35.0),
                AnimatedCard(
                  imagePath: 'assets/images/webL.png',
                  text: 'Web development',
                  width: 300.0,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: 'assets/images/app.png',
                  text: 'App development',
                  fit: BoxFit.contain,
                  reverse: true,
                  width: 300.0,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: 'assets/images/firebase.png',
                  text: 'Back-end development',
                  width: 300.0,
                ),
                SizedBox(height: 60.0),

                //Contact Forth section
                ContactFormMobile(),
                const SizedBox(height: 20.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
