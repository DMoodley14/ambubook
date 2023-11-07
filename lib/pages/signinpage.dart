import 'package:flutter/material.dart';
import '../forms/signinForm.dart';
import '../widgets.dart/formWidgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          // Phone layout
          return HomePageMobile(
            form: SignupForm(),
          );
        } else {
          // Web layout
          return HomePageWeb(
            form: Flexible(flex: 3, fit: FlexFit.tight, child: SignupForm()),
          );
        }
      },
    );
  }
}
