import 'package:flutter/material.dart';
import 'package:teste_gis/pages/login/login_page.dart';
import 'package:teste_gis/pages/progress/progress_page.dart';
import 'package:teste_gis/pages/progress/progress_page_arguments.dart';
import 'package:teste_gis/pages/tabs_page/tabs_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      // routes: AppRoutes.routes,
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          '/': (context) => LoginPage(),
          '/tabs': (context) => TabsPage(settings.arguments as int?),
          '/progress': (context) =>
              ProgressPage(settings.arguments as ProgressPageArguments)
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(
            builder: (BuildContext context) => builder(context));
      },
    );
  }
}
