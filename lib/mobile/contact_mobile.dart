import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../web/components.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.sizeOf(context).width;
    return Scaffold(
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
                  'assets/images/image-circle.png',
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Wrap(
            runSpacing: 20.0,
            spacing: 20.0,
            alignment: WrapAlignment.center,
            children: [
              SansBold(text: 'Contact me', size: 35.0),
              TextForm(
                text: 'First name',
                containerWidth: widthDevice / 1.4,
                hintText: 'Please type first name',
              ),
              TextForm(
                text: 'Phone number',
                containerWidth: widthDevice / 1.4,
                hintText: 'Please type phone number',
              ),
              TextForm(
                text: 'Email',
                containerWidth: widthDevice / 1.4,
                hintText: 'Please type email address',
              ),

              TextForm(
                text: 'Message',
                containerWidth: widthDevice / 1.4,
                hintText: 'Message',
                maxLine: 10,
              ),

              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 60.0,
                minWidth: widthDevice / 2.2,
                color: Colors.tealAccent,
                child: SansBold(text: 'Submit', size: 20.0),
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
