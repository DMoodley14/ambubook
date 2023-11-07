import 'package:ambubook/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../widgets.dart/formWidgets.dart';

class Form2 extends StatelessWidget {
  Form2({
    required this.fromFacilityController,
    required this.fromWardController,
  });
  final TextEditingController fromFacilityController;
  final TextEditingController fromWardController;

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
            'Facility Referring From:',
            style: kFormHeading(context),
          ),
          SizedBox(height: 26.0),
          CustomFormField(
            controller: fromFacilityController,
            label: 'From Facility',
          ),
          SizedBox(height: 16.0),
          CustomFormField(
            controller: fromWardController,
            label: 'From Ward',
          ),
        ],
      ),
    );
  }
}
