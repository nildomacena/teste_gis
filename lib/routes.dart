import 'package:flutter/cupertino.dart';
import 'package:teste_gis/pages/login/login_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => LoginPage(),
    /* '/tabs': (context) => const TabsPage(),
    '/progress': (context) => const ProgressPage(), */
  };
}
