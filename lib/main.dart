import 'package:ambubook/pages/loginpage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambubook',
      theme: ThemeData.light(useMaterial3: true),
      home: AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 500 ? 24 : 16,
                  fontWeight: FontWeight.bold),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                      'Ambubook\nInterfacility Transfer Booking System',
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        ),
        nextScreen: LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
