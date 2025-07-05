import 'package:aman_singh/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
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
        // First Page
        children: [
          SizedBox(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: SansBold(text: 'Hello I\'m', size: 15),
                    ),
                    const SizedBox(height: 15),
                    SansBold(text: 'Aman singh', size: 55),
                    Sans(text: 'Flutter developer', size: 30),
                    Row(
                      children: [
                        Icon(Icons.email),
                        const SizedBox(width: 20),
                        Sans(text: 'amanrawat6767@gmail.com', size: 15),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.call),
                        const SizedBox(width: 20),
                        Sans(text: '+91 7618447467', size: 15),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        const SizedBox(width: 20),
                        Sans(
                          text: 'Sewla Kalna chandrabani Road D.dun',
                          size: 15,
                        ),
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
                      backgroundImage: AssetImage(
                        'assets/images/image-circle.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Second Page
          SizedBox(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/web.jpg', height: widthDevice / 1.9),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(text: 'About me', size: 40),
                    const SizedBox(height: 15),
                    Sans(
                      text:
                          'Hello! I\'m Aman singh a Software Developer Engineer ',
                      size: 15,
                    ),
                    Sans(
                      text:
                          'I strive to ensure astounding performance with state of ',
                      size: 15,
                    ),
                    Sans(
                      text:
                          'the art security for android, Ios, Web, Mac, Linux and Windows',
                      size: 15,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        tealContainer('Flutter'),

                        const SizedBox(width: 7),
                        tealContainer('Firebase'),

                        const SizedBox(width: 7),
                        tealContainer('Android Development'),

                        const SizedBox(width: 7),
                        tealContainer('Kotlin'),

                        const SizedBox(width: 7),
                        tealContainer('JAVA'),

                        const SizedBox(width: 7),
                        tealContainer('Data Structure'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Third Section
          SizedBox(
            height: heightDevice / 1.3,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SansBold(text: 'What I do?', size: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedCard(
                        imagePath: 'assets/images/webL.png',
                        text: 'Web development',
                        fit: BoxFit.contain,
                        reverse: true,
                      ),
                      AnimatedCard(
                        imagePath: 'assets/images/app.png',
                        text: 'App development',
                        fit: BoxFit.contain,
                        reverse: true,
                      ),
                      AnimatedCard(
                        imagePath: 'assets/images/firebase.png',
                        text: 'Back-end development',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //Forth section
          SizedBox(height: 15.0),
          ContactFormWeb(),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
