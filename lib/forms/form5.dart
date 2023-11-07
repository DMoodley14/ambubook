import 'package:ambubook/widgets.dart/formWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../const.dart';

class Form5 extends StatelessWidget {
  Form5(
      {required this.patientFileNoController,
      required this.ageController,
      required this.diagnosisController,
      required this.categoryController,
      required this.heartRateController,
      required this.bpController,
      required this.satsController,
      required this.tempController,
      required this.hgtController,
      required this.gcsController,
      required this.specialConsiderationsController});
  final TextEditingController patientFileNoController;
  final TextEditingController ageController;
  final TextEditingController diagnosisController;
  final TextEditingController categoryController;
  final TextEditingController heartRateController;
  final TextEditingController bpController;
  final TextEditingController satsController;
  final TextEditingController tempController;
  final TextEditingController hgtController;
  final TextEditingController gcsController;
  final TextEditingController specialConsiderationsController;

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
            'Patient details:',
            style: kFormHeading(context),
          ),
          SizedBox(height: 16.0),
          Wrap(
            spacing: 30,
            runSpacing: 15,
            direction: Axis.horizontal,
            children: [
              CustomFormFieldSmall(
                  controller: patientFileNoController,
                  label: 'Patient File No'),
              CustomFormFieldSmall(controller: ageController, label: 'Age'),
              CustomFormFieldSmall(
                  controller: diagnosisController, label: 'Diagnosis'),
              CustomFormFieldSmall(
                  controller: categoryController, label: 'Category'),
              CustomFormFieldSmall(
                  controller: heartRateController, label: 'Heart Rate'),
              CustomFormFieldSmall(controller: bpController, label: 'BP'),
              CustomFormFieldSmall(controller: satsController, label: 'Sats'),
              CustomFormFieldSmall(
                  controller: tempController, label: 'Temperature'),
              CustomFormFieldSmall(
                  controller: hgtController, label: 'Blood Sugar'),
              CustomFormFieldSmall(controller: gcsController, label: 'GCS'),
              TextFormField(
                style: kFormFields(context),
                controller: specialConsiderationsController,
                minLines: 1,
                maxLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  constraints: BoxConstraints.tight(
                      Size(MediaQuery.of(context).size.width * 0.7, 120)),
                  labelText: 'Special Considerations',
                  border: OutlineInputBorder(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
