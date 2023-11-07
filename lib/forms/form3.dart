import 'package:ambubook/widgets.dart/formWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../const.dart';

class Form3 extends StatelessWidget {
  Form3({required this.toFacilityController, required this.toWardController});
  final TextEditingController toFacilityController;
  final TextEditingController toWardController;

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
          Text(
            'Facility Referring To:',
            style: kFormHeading(context),
          ),
          SizedBox(height: 26.0),
          CustomFormField(
              controller: toFacilityController, label: 'To Facility'),
          SizedBox(height: 16.0),
          CustomFormField(controller: toWardController, label: 'To Ward'),
        ],
      ),
    );
  }
}
