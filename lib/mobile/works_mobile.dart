import 'package:aman_singh/web/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class WorksMobile extends StatefulWidget {
  const WorksMobile({super.key});

  @override
  State<WorksMobile> createState() => _WorksMobileState();
}

class _WorksMobileState extends State<WorksMobile> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,

        endDrawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DrawerHeader(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.black),
                  ),
                  child: Image.asset(
                    'assets/images/works.png',
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              TabsMobile(text: 'Home', route: '/'),
              SizedBox(height: 20.0),
              TabsMobile(text: 'Works', route: '/works'),
              const SizedBox(height: 20.0),
              TabsMobile(text: 'Blog', route: '/blog'),
              const SizedBox(height: 20.0),
              TabsMobile(text: 'About', route: '/about'),
              const SizedBox(height: 20.0),
              TabsMobile(text: 'Contact', route: '/contact'),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _getSocialMediaButton(
                    'https://www.instagram.com/tomcruise',
                    'assets/images/instagram.svg',
                  ),
                  _getSocialMediaButton(
                    'https://www.twitter.com/tomcruise',
                    'assets/images/twitter.svg',
                  ),
                  _getSocialMediaButton(
                    'https://github.com/Aman-Singh-Rawat',
                    'assets/images/github.svg',
                  ),
                ],
              ),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 400.0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(size: 35.0, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/contact_image.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 20.0),
                  SansBold(text: 'Works', size: 35.0),
                  const SizedBox(height: 20.0),
                  AnimatedCard(
                    imagePath: 'assets/images/portfolio_screenshots.png',
                    width: 300.0,
                    height: 150.0,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 30.0),
                  SansBold(text: "portfolio", size: 20.0),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Sans(
                      text:
                          "Deployed on Android, IOS and Web, the portfolio project was truly an achievement. I used Flutter to develop the beautiful and responsive UI and Firebase for the back-end.",
                      size: 15.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconButton _getSocialMediaButton(String imageUrl, String imagePath) {
    return IconButton(
      onPressed: () async => await launchUrl(Uri.parse(imageUrl)),
      icon: SvgPicture.asset(imagePath, color: Colors.black, width: 35.0),
    );
  }
}
