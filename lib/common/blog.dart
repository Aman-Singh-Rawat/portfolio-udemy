import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.sizeOf(context).width > 800;
    return SafeArea(
      child: Scaffold(
        endDrawer: DrawersMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(size: 35.0, color: Colors.black),
                expandedHeight: isWeb ? 500.0 : 400.0,

                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/blog.jpg",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                  centerTitle: !isWeb,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: isWeb ? 7.0 : 4.0,
                    ),
                    child: AbelCustom(
                      text: 'Welcome to my Blog',
                      size: isWeb ? 30.0 : 24.0,
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
                        snpshot.data!.docs[index].data();

                    return BlogPost(
                      title: data['title']?.toString() ?? 'No Title',
                      body: data['body']?.toString() ?? 'No Body',
                      isWeb: isWeb,
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
  final isWeb;

  const BlogPost({
    super.key,
    required this.title,
    required this.body,
    @required this.isWeb,
  });

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expands = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          widget.isWeb
              ? EdgeInsets.only(left: 70.0, right: 70.0, top: 40.0)
              : EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
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
