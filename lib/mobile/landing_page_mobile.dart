import 'package:aman_singh/web/components.dart';
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
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailNameController = TextEditingController();
  final TextEditingController _phoneNameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final Logger logger = Logger();
  final formKey = GlobalKey<FormState>();
  tealContainer(String text) {
    return Wrap(
      spacing: 7.0,
      runSpacing: 7.0,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.tealAccent,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.all(7.0),
          child: Text(text, style: GoogleFonts.openSans(fontSize: 15.0)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
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
                  child: Image.asset('assets/images/image-circle.png'),
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
                Form(
                  key: formKey,
                  child: Wrap(
                    runSpacing: 20.0,
                    spacing: 20.0,
                    alignment: WrapAlignment.center,
                    children: [
                      SansBold(text: 'Contact me', size: 35.0),
                      TextForm(
                        text: 'First Name',
                        containerWidth: widthDevice / 1.4,
                        hintText: 'Please type first name',
                        controller: _firstNameController,
                              validator: (text) {
                                if (text.toString().trim().isEmpty) {
                                  return 'First name is required';
                                }
                              },
                      ),
                      TextForm(
                        text: 'Last Name',
                        containerWidth: widthDevice / 1.4,
                        hintText: 'Please type last name',
                        controller: _lastNameController,
                      ),
                      TextForm(
                        text: 'Email',
                        containerWidth: widthDevice / 1.4,
                        hintText: 'Please type email address',
                        controller: _emailNameController,
                      ),
                      TextForm(
                        text: 'Phone number',
                        containerWidth: widthDevice / 1.4,
                        hintText: 'Please type phone number',
                        controller: _phoneNameController,
                      ),
                      TextForm(
                        text: 'Message',
                        containerWidth: widthDevice / 1.4,
                        hintText: 'Message',
                        maxLine: 10,
                        controller: _messageController,
                      ),
                      MaterialButton(
                        onPressed: () async {
                        logger.d(_firstNameController.text.toString());
                        final addData = new AddDataFirestore();
                  
                        if (formKey.currentState!.validate()) {
                          await addData.addResponse(
                            _firstNameController.text,
                            _lastNameController.text,
                            _emailNameController.text,
                            _phoneNameController.text,
                            _messageController.text,
                          );
                          formKey.currentState!.reset();
                          dialogError(context);
                        }
                      },
                        elevation: 20.0,
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
                const SizedBox(height: 20.0),
              ],
            ),
          ],
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
