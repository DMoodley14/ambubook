import 'package:ambubook/widgets.dart/formWidgets.dart';
import 'package:flutter/material.dart';
import '../forms/loginForm.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          // Phone layout
          return HomePageMobile(
            form: LoginForm(
              emailController: _emailController,
              passwordController: _passwordController,
            ),
          );
        } else {
          // Web layout
          return HomePageWeb(
            form: Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: LoginForm(
                emailController: _emailController,
                passwordController: _passwordController,
              ),
            ),
          );
        }
      },
    );
  }
}
