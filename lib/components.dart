import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/web.dart';
import 'package:url_launcher/url_launcher.dart';

class TabsWeb extends StatefulWidget {
  const TabsWeb({required this.title, super.key, this.route});

  final title;
  final route;

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style:
              _isSelected
                  ? GoogleFonts.roboto(
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -8)),
                    ],
                    fontSize: 25.0,
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationColor: Colors.tealAccent,
                  )
                  : GoogleFonts.roboto(color: Colors.black, fontSize: 20.0),
          child: Text(
            widget.title,
            style: GoogleFonts.roboto(color: Colors.black, fontSize: 23.0),
          ),
        ),
      ),
    );
  }
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(flex: 3),
        TabsWeb(title: 'Home', route: '/'),
        Spacer(),
        TabsWeb(title: 'Work', route: '/works'),
        Spacer(),
        TabsWeb(title: 'Blog', route: '/blog'),
        Spacer(),
        TabsWeb(title: 'About', route: '/about'),
        Spacer(),
        TabsWeb(title: 'Contact', route: '/contact'),
        Spacer(),
      ],
    );
  }
}

class DrawersMobile extends StatefulWidget {
  const DrawersMobile({super.key});

  @override
  State<DrawersMobile> createState() => _DrawersMobileState();
}

class _DrawersMobileState extends State<DrawersMobile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
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

class DrawersWeb extends StatefulWidget {
  const DrawersWeb({super.key});

  @override
  State<DrawersWeb> createState() => _DrawersWebState();
}

class _DrawersWebState extends State<DrawersWeb> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;

  const TabsMobile({super.key, required this.text, required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      elevation: 20.0,
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Text(widget.text, style: TextStyle(color: Colors.white)),
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;

  const SansBold({super.key, this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;

  const Sans({super.key, this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(fontSize: size));
  }
}

class AbelCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;

  const AbelCustom({
    super.key,
    this.text,
    this.size,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  const TextForm({
    required this.text,
    required this.containerWidth,
    required this.hintText,
    this.validator,
    this.controller,
    this.maxLine,

    super.key,
  });

  final String text;
  final double containerWidth;
  final int? maxLine;
  final controller;
  final validator;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text: text, size: 16),
        const SizedBox(height: 5),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            validator: validator,
            maxLines: maxLine,
            controller: controller,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({
    super.key,
    required this.imagePath,
    this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  });

  final imagePath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _animation = Tween(
      begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
      end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height ?? 200.0,
                width: widget.width ?? 200.0,
                fit: widget.fit,
              ),
              const SizedBox(height: 10),
              widget.text == null
                  ? SizedBox()
                  : SansBold(text: widget.text, size: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

class AddDataFirestore {
  CollectionReference reference = FirebaseFirestore.instance.collection(
    'messages',
  );

  Future<bool> addResponse(
    final firstName,
    final lastName,
    final email,
    final phoneNumber,
    final message,
  ) {
    return reference
        .add({
          'first name': firstName,
          'last name': lastName,
          'email': email,
          'phone number': phoneNumber,
          'message': message,
        })
        .then((value) {
          logger.d("success");
          return true;
        })
        .catchError((error) {
          logger.d("error");
          return false;
        });
  }
}

Future dialogError(BuildContext context, String title) {
  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: SansBold(text: title, size: 20.0),
        ),
  );
}

// Variables
final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailNameController = TextEditingController();
final TextEditingController _phoneNameController = TextEditingController();
final TextEditingController _messageController = TextEditingController();
final Logger logger = Logger();

// Classes and methods
class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({super.key});

  @override
  State<ContactFormWeb> createState() => _ContactFormWebState();
}

class _ContactFormWebState extends State<ContactFormWeb> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.sizeOf(context).width;
    return Form(
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
          const SizedBox(height: 20.0),
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
    );
  }
}

class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  State<ContactFormMobile> createState() => _ContactFormMobileState();
}

class _ContactFormMobileState extends State<ContactFormMobile> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.sizeOf(context).width;
    return Form(
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
    );
  }
}

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
