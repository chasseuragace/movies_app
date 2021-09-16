import 'package:flutter/material.dart';
import 'package:movies_app/features/homepage/ui/details_page/details_page.dart';
import 'package:movies_app/features/homepage/ui/homepage.dart';
import 'package:movies_app/theme/theme_constants.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //using the the we defined earlier
      theme: AppThemeConstants.appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => Detailspage(),
      },
    );
  }
}
