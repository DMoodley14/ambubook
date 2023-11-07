import 'package:ambubook/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Form0 extends StatelessWidget {
  final TextEditingController fromFacilityController = TextEditingController();
  final TextEditingController fromWardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        SlideEffect(
          begin: Offset(1, 0),
          end: Offset.zero,
          duration: Duration(milliseconds: 300),
        )
      ],
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              '''Welcome back to Ambubook\n\nInterfacility booking system in collaboration with \nLimpopo Provincial Department of Health''',
              style: kFormHeading(context),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
