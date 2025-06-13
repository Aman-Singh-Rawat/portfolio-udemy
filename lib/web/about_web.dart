import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.tealAccent, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.all(7.0),
      child: Text(text, style: GoogleFonts.openSans(fontSize: 15.0)),
    );
  }

  urlLauncher(String imageUrl, String imagePath) {
    return IconButton(
      onPressed: () async {
        await launchUrl(Uri.parse(imageUrl));
      },
      icon: SvgPicture.asset(
        imagePath,
        width: 35,
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.sizeOf(context).height;
    var widthDevice = MediaQuery.sizeOf(context).width;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/image-circle.png'),
              ),
            ),
            const SizedBox(height: 15),
            SansBold(text: 'Aman singh', size: 30),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher(
                  'https://www.instagram.com/tomcruise',
                  'assets/images/instagram.svg',
                ),
                urlLauncher(
                  'https://www.twitter.com/tomcruise',
                  'assets/images/twitter.svg',
                ),
                urlLauncher(
                  'https://github.com/Aman-Singh-Rawat',
                  'assets/images/github.svg',
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(size: 25, color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            Spacer(flex: 3),
            TabsWeb(title: 'Home', route: '/'),
            Spacer(),
            TabsWeb(title: 'Works', route: '/works'),
            Spacer(),
            TabsWeb(title: 'Blog', route: '/blog'),
            Spacer(),
            TabsWeb(title: 'About', route: '/about'),
            Spacer(),
            TabsWeb(title: 'Contact', route: '/contact'),
          ],
        ),
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
