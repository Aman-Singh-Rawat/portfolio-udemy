import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.sizeOf(context).height;
    var widthDevice = MediaQuery.sizeOf(context).width;

    return Scaffold(
      drawer: DrawersWeb(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(size: 25, color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: TabsWebList(),
      ),
      body: ListView(
        children: [
          //About me, first section
          SizedBox(
            height: 500.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(text: 'About me', size: 40.0),
                    SizedBox(height: 15.0),
                    Sans(
                      text:
                          'Hello! I\'m Aman singh I specialize in flutter development',
                      size: 15.0,
                    ),
                    Sans(
                      text:
                          "I strive to ensure astounding performance with state of the art security for android, Ios, Web, Mac, Linux and Windows",
                      size: 15.0,
                    ),
                    Sans(
                      text:
                          "the art security for Android, Ios, Web, Mac, Linux, and Windows",
                      size: 15.0,
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        tealContainer('Flutter'),
                        const SizedBox(width: 7.0),
                        tealContainer('Firebase'),
                        const SizedBox(width: 7.0),
                        tealContainer('Android'),
                        const SizedBox(width: 7.0),
                        tealContainer('IOS'),
                        const SizedBox(width: 7.0),
                        tealContainer('Windows'),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 147,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 143,
                    child: CircleAvatar(
                      radius: 140.0,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'assets/images/image-circle.png',
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Web development, second section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: 'assets/images/webL.png',
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold(text: 'Web development', size: 30.0),
                    const SizedBox(height: 15.0),
                    Sans(
                      text:
                          "I'm here to build your presence online with state of the art web apps",
                      size: 15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20.0),
          //App development, third section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold(text: "App development", size: 30.0),
                    const SizedBox(height: 15.0),
                    Sans(
                      text:
                          "Do you need high-performance and beautiful app? Don't worry, I've got you covered.",
                      size: 15.0,
                    ),
                  ],
                ),
              ),
              AnimatedCard(
                imagePath: 'assets/images/app.png',
                height: 250.0,
                width: 250.0,
                reverse: true,
              ),
            ],
          ),
          const SizedBox(height: 20.0),

          //Back-end development, fourth section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: 'assets/images/firebase.png',
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold(text: 'Back-end development', size: 30.0),
                    const SizedBox(height: 15.0),
                    Sans(
                      text:
                          "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that.",
                      size: 15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
