import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';

import '../pages/loginpage.dart';
import '../widgets.dart/formWidgets.dart';

class SignupForm extends StatefulWidget {
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController regNumberController = TextEditingController();
  var obscurePass = true;
  Future<void> _signUp() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Sign-up successful, navigate to the login page or any other page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } catch (e) {
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
        ]).value!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Welcome to Ambubook',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Text('Register your account'),
                    const SizedBox(height: 50.0),
                    Wrap(
                      spacing: 30,
                      runSpacing: 15,
                      direction: Axis.horizontal,
                      children: [
                        Column(
                          children: [
                            LoginFormField(
                              controller: emailController,
                              label: 'Email',
                              icon: Icons.email,
                            ),
                            const SizedBox(height: 20.0),
                            TextField(
                              controller: passwordController,
                              obscureText: obscurePass,
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
                                      ResponsiveValue<double>(context,
                                          conditionalValues: [
                                            const Condition.equals(
                                                name: MOBILE, value: 32),
                                            const Condition.equals(
                                                name: TABLET, value: 36),
                                            const Condition.equals(
                                                name: DESKTOP, value: 40),
                                            const Condition.equals(
                                                name: '4K', value: 50)
                                          ]).value!)),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(fontSize: 16),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    size: 15,
                                  ),
                                  prefixIconColor:
                                      const Color.fromARGB(255, 188, 158, 194),
                                  suffixIconColor:
                                      const Color.fromARGB(255, 188, 158, 194),
                                  suffixIcon: GestureDetector(
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      size: 18,
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
                            const SizedBox(height: 20.0),
                            TextField(
                              controller: passwordConfirmationController,
                              obscureText: obscurePass,
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
                                      ResponsiveValue<double>(context,
                                          conditionalValues: [
                                            const Condition.equals(
                                                name: MOBILE, value: 32),
                                            const Condition.equals(
                                                name: TABLET, value: 36),
                                            const Condition.equals(
                                                name: DESKTOP, value: 40),
                                            const Condition.equals(
                                                name: '4K', value: 50)
                                          ]).value!)),
                                  labelText: 'Confirm Password',
                                  labelStyle: TextStyle(fontSize: 16),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    size: 15,
                                  ),
                                  prefixIconColor:
                                      const Color.fromARGB(255, 188, 158, 194),
                                  suffixIconColor:
                                      const Color.fromARGB(255, 188, 158, 194),
                                  suffixIcon: GestureDetector(
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      size: 18,
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
                          ],
                        ),
                        Column(
                          children: [
                            LoginFormField(
                                controller: nameController,
                                label: 'Full Name',
                                icon: Icons.person),
                            SizedBox(
                              height: 20,
                            ),
                            LoginFormField(
                                controller: contactController,
                                label: 'Contact number',
                                icon: Icons.phone),
                            SizedBox(
                              height: 20,
                            ),
                            LoginFormField(
                                controller: regNumberController,
                                label: 'MP/SANC number',
                                icon: Icons.app_registration_rounded),
                          ],
                        )
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: _signUp,
                        child: const Text('Sign Up'),
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(100, 50)),
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context)
                                    .colorScheme
                                    .primaryContainer))),
                    //Text button to navigate to sign up page
                    const SizedBox(height: 20.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: const Text('Already have an acccount? Login'),
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
