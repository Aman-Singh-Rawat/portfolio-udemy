import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../web/components.dart';

class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});

  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
  void article() async {
    await FirebaseFirestore.instance.collection('articles').get().then((
      querySnapshot,
    ) {
      querySnapshot.docs.forEach((element) {});
    });
  }

  void streamArticle() async {}

  IconButton _getSocialMediaButton(String imageUrl, String imagePath) {
    return IconButton(
      onPressed: () async => await launchUrl(Uri.parse(imageUrl)),
      icon: SvgPicture.asset(imagePath, color: Colors.black, width: 35.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(size: 35.0, color: Colors.black),
                expandedHeight: 400.0,

                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/blog.jpg",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                  centerTitle: true,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: AbelCustom(
                      text: 'Welcome to my Blog',
                      size: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('article').snapshots(),
            builder: (context, snpshot) {
              if (snpshot.hasData) {
                final post = snpshot.data!.docs;
                return ListView.builder(
                  itemCount: snpshot.data!.size,
                  itemBuilder: (context, index) {
                    final Map<String, dynamic> data =
                        snpshot.data!.docs[index].data()
                            as Map<String, dynamic>;

                    return BlogPost(
                      title: data['title']?.toString() ?? 'No Title',
                      body: data['body']?.toString() ?? 'No Body',
                    );
                  },
                );
              } else if (snpshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              return Center(
                child: Text(
                  "Data is not available",
                  style: TextTheme.of(context).titleLarge,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class BlogPost extends StatefulWidget {
  final title;
  final body;

  const BlogPost({super.key, required this.title, required this.body});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expands = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: AbelCustom(
                    text: widget.title,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expands = !expands;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Text(
                widget.body,
                maxLines: expands == true ? null : 3,
                overflow:
                    expands ? TextOverflow.visible : TextOverflow.ellipsis,
                style: GoogleFonts.openSans(fontSize: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
