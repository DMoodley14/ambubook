import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../const.dart';
import '../widgets.dart/formWidgets.dart';

class Form4 extends StatelessWidget {
  Form4(
      {required this.referringDoctorNameController,
      required this.referringDoctorNumberController,
      required this.acceptingDoctorNameController,
      required this.acceptingDoctorNumberController});

  final TextEditingController referringDoctorNameController;
  final TextEditingController referringDoctorNumberController;
  final TextEditingController acceptingDoctorNameController;
  final TextEditingController acceptingDoctorNumberController;

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
            'Personel Contact Details:',
            style: kFormHeading(context),
          ),
          SizedBox(height: 26.0),
          CustomFormField(
              controller: referringDoctorNameController,
              label: 'Referring Clinician'),
          SizedBox(
            height: 16,
          ),
          CustomFormField(
              controller: referringDoctorNumberController,
              label: "Referring Clinician's Number"),
          SizedBox(height: 16.0),
          CustomFormField(
              controller: acceptingDoctorNameController,
              label: 'Accepting Clinician'),
          SizedBox(height: 16.0),
          CustomFormField(
              controller: acceptingDoctorNumberController,
              label: "Accepting Clinician's Number"),
        ],
      ),
    );
  }
}
