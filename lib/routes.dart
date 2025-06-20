import 'package:aman_singh/mobile/works_mobile.dart';
import 'package:aman_singh/web/about_web.dart';
import 'package:aman_singh/web/blog_web.dart';
import 'package:aman_singh/web/contact_web.dart';
import 'package:aman_singh/web/landing_page_web.dart';
import 'package:aman_singh/web/works_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'mobile/about_mobile.dart';
import 'mobile/blog_mobile.dart';
import 'mobile/contact_mobile.dart';
import 'mobile/landing_page_mobile.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder:
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return LandingPageWeb();
                  } else {
                    return LandingPageMobile();
                  }
                },
              ),
        );
      case '/contact':
        return MaterialPageRoute(
          builder: (context) {
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return ContactWeb();
                } else {
                  return ContactMobile();
                }
              },
            );
          },
          settings: settings,
        );
      case '/about':
        return MaterialPageRoute(
          builder:
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return AboutWeb();
                  } else {
                    return AboutMobile();
                  }
                },
              ),
          settings: settings,
        );
      case '/blog':
        return MaterialPageRoute(
          builder:
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return BlogWeb();
                  } else {
                    return BlogMobile();
                  }
                },
              ),
          settings: settings,
        );
      case '/works':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return WorksWeb();
            } else {
              return WorksMobile();
            }
          }),
          settings: settings
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return LandingPageWeb();
                  } else {
                    return LandingPageMobile();
                  }
                },
              ),
        );
    }
  }
}
