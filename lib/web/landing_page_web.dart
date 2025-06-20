import 'package:aman_singh/web/components.dart';
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
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailNameController = TextEditingController();
  final TextEditingController _phoneNameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final Logger logger = Logger();
  final formKey = GlobalKey<FormState>();

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
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(7),
                          child: Sans(text: 'Flutter', size: 15),
                        ),

                        const SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(7),
                          child: Sans(text: 'Firebase', size: 15),
                        ),

                        const SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(7),
                          child: Sans(text: 'Android Development', size: 15),
                        ),

                        const SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(7),
                          child: Sans(text: 'Kotlin', size: 15),
                        ),

                        const SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(7),
                          child: Sans(text: 'JAVA', size: 15),
                        ),

                        const SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(7),
                          child: Sans(text: 'Data Structure', size: 15),
                        ),
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
          SizedBox(
            height: heightDevice,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SansBold(text: 'Contact me', size: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          TextForm(
                            containerWidth: 350,
                            text: 'First Name',
                            controller: _firstNameController,
                            validator: (text) {
                              if (text.toString().trim().isEmpty) {
                                return 'First name is required';
                              }
                            },
                            hintText: 'Please type your first name',
                          ),
                          SizedBox(height: 15),
                          TextForm(
                            text: 'Email',
                            containerWidth: 350,
                            validator: (text) {
                              if (text.toString().trim().isEmpty) {
                                return 'Email is required';
                              }
                            },
                            hintText: 'Please type your email address',
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextForm(
                            containerWidth: 350,
                            text: 'Last Name',
                            controller: _lastNameController,
                            hintText: 'Please type your last name',
                          ),
                          SizedBox(height: 15),
                          TextForm(
                            text: 'Phone number',
                            containerWidth: 350,
                            controller: _phoneNameController,
                            hintText: 'Please type your phone number',
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextForm(
                    text: 'Message',
                    controller: _messageController,
                    containerWidth: widthDevice / 1.5,
                    hintText: 'Please type your message',
                    validator: (text) {
                      if (text.toString().trim().isEmpty) {
                        return 'Message is required';
                      }
                    },
                    maxLine: 10,
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
                    minWidth: 200.0,
                    color: Colors.tealAccent,
                    child: SansBold(text: 'Submit', size: 20.0),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
