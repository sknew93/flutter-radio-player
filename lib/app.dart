import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:radiostring/blocs/config.dart';
import 'package:radiostring/pages/about_us.dart';
import 'package:radiostring/pages/contact_us.dart';
import 'package:radiostring/pages/home.dart';
import 'package:radiostring/pages/privacy_policy.dart';
import 'package:radiostring/pages/splash_screen.dart';
import 'package:radiostring/pages/terms_conditions.dart';
import 'package:radiostring/themes/custom_theme.dart';

// final ThemeData kIOSTheme = new ThemeData(
//   primarySwatch: Colors.grey,
//   primaryColor: Colors.black,
//   primaryColorBrightness: Brightness.dark,
// );
//
// final ThemeData kDefaultTheme = new ThemeData(
//     primarySwatch: Colors.grey,
//     canvasColor: Color.fromRGBO(221, 221, 221, 1.0));

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new RadioString());
  });
}

class RadioString extends StatefulWidget {
  @override
  State createState() => _RadioStringState();
}

class _RadioStringState extends State<RadioString> {

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print('Changes');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
      title: 'Radiostring',
      debugShowCheckedModeBanner: false,
      theme: customThemeDataLight,
      darkTheme: customThemeDataDark,
      themeMode: currentTheme.currentTheme(),
      home: SplashScreen(),
      routes: {
        '/home': (BuildContext context) => Home(),
        '/about' : (BuildContext context) => AboutUs(),
        '/privacy_policy' : (BuildContext context) => PrivacyPolicy(),
        '/terms_conditions' : (BuildContext context) => TermsConditions(),
        '/contact_us' : (BuildContext context) => ContactUs(),
      },
      onGenerateRoute: (RouteSettings settings) {
        print(settings);
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        return null;
      },
    ));
  }
}
