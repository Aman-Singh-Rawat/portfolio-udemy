import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailNameController = TextEditingController();
  final TextEditingController _phoneNameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final Logger logger = Logger();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/image-circle.png'),
              ),
            ),
            const SizedBox(height: 15),
            SansBold(text: 'Aman Singh', size: 30.0),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await launchUrl(
                      Uri.parse('https://www.instagram.com/tomcruise'),
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/instagram.svg',
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launchUrl(
                      Uri.parse('https://www.twitter.com/tomcruise'),
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/twitter.svg',
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launchUrl(
                      Uri.parse('https://github.com/Aman-Singh-Rawat'),
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/github.svg',
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/contact_image.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: Row(
                children: [
                  Spacer(flex: 3),
                  TabsWeb(title: 'Home', route: '/'),
                  Spacer(),
                  TabsWeb(title: 'Work', route: '/woks'),
                  Spacer(),
                  TabsWeb(title: 'Blog', route: '/blog'),
                  Spacer(),
                  TabsWeb(title: 'About', route: '/about'),
                  Spacer(),
                  TabsWeb(title: 'Contact', route: '/contact'),
                  Spacer(),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(height: 30.0),
                SansBold(text: 'Contact me', size: 40.0),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          containerWidth: 350,
                          text: 'First Name',
                          hintText: 'Please type your first name',
                          validator: (text) {
                            if (text.toString().trim().isEmpty) {
                              return 'First name is required';
                            }
                          },
                        ),
                        SizedBox(height: 15),
                        TextForm(
                          text: 'Email',
                          containerWidth: 350,
                          hintText: 'Please type your email address',
                          controller: _emailNameController,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                          containerWidth: 350,
                          text: 'Last Name',
                          hintText: 'Please type your last name',
                          controller: _lastNameController,
                        ),
                        SizedBox(height: 15),
                        TextForm(
                          text: 'Phone number',
                          containerWidth: 350,
                          hintText: 'Please type your phone number',
                          controller: _phoneNameController,
                        ),
                      ],
                    ),
                  ],
                ),
                TextForm(
                  text: 'Message',
                  containerWidth: widthDevice / 1.5,
                  hintText: 'Please type your message',
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
                  minWidth: 200.0,
                  color: Colors.tealAccent,
                  child: SansBold(text: 'Submit', size: 20.0),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
