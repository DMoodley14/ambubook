import 'package:ambubook/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../pages/homepage.dart';
import '../pages/signinpage.dart';
import '../widgets.dart/formWidgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var obscurePass = true;
  Future<void> login() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: widget._emailController.text,
        password: widget._passwordController.text,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MultiFormPage(),
        ),
      );
    } catch (e) {
//if auth fails, show error message as a pop up
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid email or password'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );

      // Handle login errors
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveValue<double>(context, conditionalValues: [
            const Condition.equals(name: MOBILE, value: 16),
            const Condition.equals(name: TABLET, value: 18),
            const Condition.equals(name: DESKTOP, value: 20),
            const Condition.equals(name: '4K', value: 22)
          ]).value!.toDouble(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back to Ambubook',
                      textAlign: TextAlign.center,
                      style: kFormHeading(context),
                    ),
                    Text(
                      'Please log in below',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height:
                          ResponsiveValue<double>(context, conditionalValues: [
                        const Condition.equals(name: MOBILE, value: 20),
                        const Condition.equals(name: TABLET, value: 30),
                        const Condition.equals(name: DESKTOP, value: 50),
                        const Condition.equals(name: '4K', value: 60)
                      ]).value!.toDouble(),
                    ),
                    LoginFormField(
                      controller: widget._emailController,
                      label: 'Email',
                      icon: Icons.email,
                    ),
                    SizedBox(
                      height:
                          ResponsiveValue<double>(context, conditionalValues: [
                        const Condition.equals(name: MOBILE, value: 12),
                        const Condition.equals(name: TABLET, value: 14),
                        const Condition.equals(name: DESKTOP, value: 20),
                        const Condition.equals(name: '4K', value: 24)
                      ]).value!.toDouble(),
                    ),
                    TextField(
                      controller: widget._passwordController,
                      obscureText: obscurePass,
                      textAlignVertical: TextAlignVertical.center,
                      style: kFormFields(context),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: const OutlineInputBorder(),
                          constraints: BoxConstraints.tight(Size(
                              ResponsiveValue<double>(context,
                                  conditionalValues: [
                                    const Condition.equals(
                                        name: MOBILE, value: 200),
                                    const Condition.equals(
                                        name: TABLET, value: 220),
                                    const Condition.equals(
                                        name: DESKTOP, value: 250),
                                    const Condition.equals(
                                        name: '4K', value: 300)
                                  ]).value!,
                              ResponsiveValue<
                                  double>(context, conditionalValues: [
                                const Condition.equals(name: MOBILE, value: 36),
                                const Condition.equals(name: TABLET, value: 40),
                                const Condition.equals(
                                    name: DESKTOP, value: 42),
                                const Condition.equals(name: '4K', value: 50)
                              ]).value!)),
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            size: ResponsiveValue<
                                double>(context, conditionalValues: [
                              const Condition.equals(name: MOBILE, value: 14),
                              const Condition.equals(name: TABLET, value: 16),
                              const Condition.equals(name: DESKTOP, value: 18),
                              const Condition.equals(name: '4K', value: 22)
                            ]).value!,
                          ),
                          prefixIconColor:
                              const Color.fromARGB(255, 188, 158, 194),
                          suffixIconColor:
                              const Color.fromARGB(255, 188, 158, 194),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              Icons.remove_red_eye,
                              size: ResponsiveValue<
                                  double>(context, conditionalValues: [
                                const Condition.equals(name: MOBILE, value: 14),
                                const Condition.equals(name: TABLET, value: 16),
                                const Condition.equals(
                                    name: DESKTOP, value: 18),
                                const Condition.equals(name: '4K', value: 22)
                              ]).value!.toDouble(),
                            ),
                            onTap: () => setState(() {
                              if (obscurePass == true) {
                                obscurePass = false;
                              } else {
                                obscurePass = true;
                              }
                            }),
                          )),
                    ),
                    SizedBox(
                      height:
                          ResponsiveValue<double>(context, conditionalValues: [
                        const Condition.equals(name: MOBILE, value: 12),
                        const Condition.equals(name: TABLET, value: 14),
                        const Condition.equals(name: DESKTOP, value: 20),
                        const Condition.equals(name: '4K', value: 24)
                      ]).value!.toDouble(),
                    ),
                    ElevatedButton(
                        onPressed: login,
                        child: const Text('Login'),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(100, 50)),
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context)
                                    .colorScheme
                                    .primaryContainer))),
                    //Text button to navigate to sign up page
                    SizedBox(
                      height:
                          ResponsiveValue<double>(context, conditionalValues: [
                        const Condition.equals(name: MOBILE, value: 12),
                        const Condition.equals(name: TABLET, value: 14),
                        const Condition.equals(name: DESKTOP, value: 20),
                        const Condition.equals(name: '4K', value: 24)
                      ]).value!.toDouble(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      child: const Text('New Here? Sign Up'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
