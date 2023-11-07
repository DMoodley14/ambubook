import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../const.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: kFormFields(context),
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        constraints: BoxConstraints.tight(Size(
            ResponsiveValue<double>(context, conditionalValues: [
              const Condition.equals(name: MOBILE, value: 220),
              const Condition.equals(name: TABLET, value: 220),
              const Condition.equals(name: DESKTOP, value: 250),
              const Condition.equals(name: '4K', value: 300)
            ]).value!,
            ResponsiveValue<double>(context, conditionalValues: [
              const Condition.equals(name: MOBILE, value: 36),
              const Condition.equals(name: TABLET, value: 40),
              const Condition.equals(name: DESKTOP, value: 42),
              const Condition.equals(name: '4K', value: 50)
            ]).value!)),
        labelText: '  $label',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class CustomFormFieldSmall extends StatelessWidget {
  const CustomFormFieldSmall({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: kFormFields(context),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        constraints: BoxConstraints.tight(Size(
            ResponsiveValue<double>(context, conditionalValues: [
              const Condition.equals(name: MOBILE, value: 200),
              const Condition.equals(name: TABLET, value: 220),
              const Condition.equals(name: DESKTOP, value: 250),
              const Condition.equals(name: '4K', value: 300)
            ]).value!,
            ResponsiveValue<double>(context, conditionalValues: [
              const Condition.equals(name: MOBILE, value: 36),
              const Condition.equals(name: TABLET, value: 40),
              const Condition.equals(name: DESKTOP, value: 42),
              const Condition.equals(name: '4K', value: 50)
            ]).value!)),
        labelText: '  $label',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class LoginFormField extends StatelessWidget {
  const LoginFormField(
      {super.key,
      required this.controller,
      required this.label,
      required this.icon});

  final TextEditingController controller;
  final label;

  final icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: kFormFields(context),
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          constraints: BoxConstraints.tight(Size(
              ResponsiveValue<double>(context, conditionalValues: [
                const Condition.equals(name: MOBILE, value: 200),
                const Condition.equals(name: TABLET, value: 220),
                const Condition.equals(name: DESKTOP, value: 250),
                const Condition.equals(name: '4K', value: 300)
              ]).value!,
              ResponsiveValue<double>(context, conditionalValues: [
                const Condition.equals(name: MOBILE, value: 36),
                const Condition.equals(name: TABLET, value: 40),
                const Condition.equals(name: DESKTOP, value: 42),
                const Condition.equals(name: '4K', value: 50)
              ]).value!)),
          labelText: ' $label',
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            icon,
            size: ResponsiveValue<double>(context, conditionalValues: [
              const Condition.equals(name: MOBILE, value: 14),
              const Condition.equals(name: TABLET, value: 16),
              const Condition.equals(name: DESKTOP, value: 18),
              const Condition.equals(name: '4K', value: 22)
            ]).value!,
          ),
          prefixIconColor: Color.fromARGB(255, 188, 158, 194)),
    );
  }
}

class HomePageWeb extends StatelessWidget {
  const HomePageWeb({
    super.key,
    required this.form,
  });

  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorScheme.light().surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: FittedBox(
                              child: Image.asset(
                                'assets/ambulance.jpg',
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      form
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({
    super.key,
    required this.form,
  });

  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorScheme.light().surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image.asset(
                      'assets/ambulance.jpg',
                    ),
                  ),
                  Card(
                    child: form,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
