import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/web.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,

      endDrawer: DrawersMobile(),
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
          child: Form(
            key: formKey,
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
                  controller: _firstNameController,
                  validator: (text) {
                    if (text.toString().trim().isEmpty) {
                      return 'First name is required';
                    }
                  },
                ),
                TextForm(
                  text: 'Last name',
                  containerWidth: widthDevice / 1.4,
                  hintText: 'Please type first name',
                  controller: _lastNameController,
                ),
                TextForm(
                  text: 'Phone number',
                  containerWidth: widthDevice / 1.4,
                  hintText: 'Please type phone number',
                  controller: _phoneNameController,
                ),
                TextForm(
                  text: 'Email',
                  containerWidth: widthDevice / 1.4,
                  hintText: 'Please type email address',
                  controller: _emailNameController,
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
                      bool flag = await addData.addResponse(
                        _firstNameController.text,
                        _lastNameController.text,
                        _emailNameController.text,
                        _phoneNameController.text,
                        _messageController.text,
                      );
                      if (flag) {
                        formKey.currentState!.reset();
                        dialogError(context, "Message sent successfully");
                      } else {
                        dialogError(context, "Message failed to sent");
                      }
                    }
                  },
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
      ),
    );
  }
}
