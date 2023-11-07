import 'package:ambubook/const.dart';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../model.dart';
import '../pages/homepage.dart';

// ignore: must_be_immutable
class BookingSummaryPopup extends StatelessWidget {
  BookingSummaryPopup({super.key, required this.model, required this.email});
  BookingModel model;
  String email;

  // Future<void> sendEmail() async {
  //   final smtpServer = gmail('testerivline@gmail.com', 'tester123!');

  //   final messageToSend = Message()
  //     ..from = Address('testerivline@gmail.com', 'Ambubook')
  //     ..recipients.add(email)
  //     ..subject = 'Message from Ambubook ${DateTime.now()}'
  //     ..text = "hello world";

  //   try {
  //     final sendReport = await send(messageToSend, smtpServer);
  //     print('Message sent: ${sendReport.toString()}');
  //   } catch (e) {
  //     print('Error sending email: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Summary of your booking',
          style: TextStyle(
              fontSize: ResponsiveValue<double>(context, conditionalValues: [
                const Condition.equals(name: MOBILE, value: 17),
                const Condition.equals(name: TABLET, value: 20),
                const Condition.equals(name: DESKTOP, value: 22),
                const Condition.equals(name: '4K', value: 25)
              ]).value!,
              fontWeight: FontWeight.w700),
          //textAlign: TextAlign.center,
        ),
      ),
      content: SingleChildScrollView(
        child: Container(
            width: double.maxFinite,
            child: Center(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      ResponsiveValue<double>(context, conditionalValues: [
                const Condition.equals(name: MOBILE, value: 10),
                const Condition.equals(name: TABLET, value: 20),
                const Condition.equals(name: DESKTOP, value: 100),
                const Condition.equals(name: '4K', value: 150)
              ]).value!),
              child: Flex(
                  direction: MediaQuery.of(context).size.width > 500
                      ? Axis.horizontal
                      : Axis.vertical,
                  mainAxisAlignment: MediaQuery.of(context).size.width > 500
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EMS Station',
                            style: kSummaryHeading(context),
                          ),
                          Text('EMS Station: ${model.station}',
                              style: kSummary(context)),
                          SizedBox(height: 20),
                          Text(
                            'Facility Information:',
                            style: kSummaryHeading(context),
                          ),
                          Text(
                            'From Facility: ${model.fromFacility}',
                            style: kSummary(context),
                          ),
                          Text('From Ward: ${model.fromWard}',
                              style: kSummary(context)),
                          SizedBox(height: 10),
                          Text('To Facility: ${model.toFacility}',
                              style: kSummary(context)),
                          Text('To Ward: ${model.toWard}',
                              style: kSummary(context)),
                          SizedBox(height: 10),
                          Text(
                            'Contact Details:',
                            style: kSummaryHeading(context),
                          ),
                          Text('Referring Doctor: ${model.referringDoctor}',
                              style: kSummary(context)),
                          Text(
                              'Referring Doctor Contact: ${model.referringDoctorContact}',
                              style: kSummary(context)),
                          SizedBox(height: 10),
                          Text('Receiving Doctor: ${model.acceptingDoctor}',
                              style: kSummary(context)),
                          Text(
                              'Receiving Doctor Contact: ${model.acceptingDoctorContact}',
                              style: kSummary(context)),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Patient Information:',
                            style: kSummaryHeading(context),
                          ),
                          Text('Patient File No: ${model.patientFileNo}',
                              style: kSummary(context)),
                          Text('Patient Age: ${model.age}',
                              style: kSummary(context)),
                          Text('Diagnosis: ${model.diagnosis}',
                              style: kSummary(context)),
                          Text(
                            'Category: ${model.category}',
                            style: kSummary(context),
                          ),
                          SizedBox(height: 10),
                          Text('Heart Rate: ${model.HR}',
                              style: kSummary(context)),
                          Text('BP: ${model.BP}', style: kSummary(context)),
                          Text('Sats: ${model.sats}', style: kSummary(context)),
                          Text('Temp: ${model.temp}', style: kSummary(context)),
                          Text('HGT: ${model.HGT}', style: kSummary(context)),
                          Text('GCS: ${model.GCS}', style: kSummary(context)),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.8,
                            child: Text(
                              '''Special Considerations: ${model.specialConsiderations}''',
                              style: kSummary(context), softWrap: true,
                              //overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ))),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
            onPressed: () {
              //  await sendEmail();
              //alert dialog
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    if (model.station == "Please select your station" ||
                        model.fromFacility == '' ||
                        model.fromWard == '' ||
                        model.toFacility == '' ||
                        model.toWard == '' ||
                        model.referringDoctor == '' ||
                        model.referringDoctorContact == '' ||
                        model.acceptingDoctor == '' ||
                        model.acceptingDoctorContact == '' ||
                        model.patientFileNo == '' ||
                        model.age == '' ||
                        model.diagnosis == '' ||
                        model.category == '' ||
                        model.HR == '' ||
                        model.BP == '' ||
                        model.sats == '' ||
                        model.temp == '' ||
                        model.HGT == '' ||
                        model.GCS == '') {
                      return AlertDialog(
                        title: Text('Your booking has missing information'),
                        content: Text(
                            '''Please go back and fill in the all the required information'''),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text('OK'))
                        ],
                      );
                    } else {
                      return AlertDialog(
                        title: Text('Booking confirmed'),
                        content: Text(
                            'Your booking has been confirmed. You will receive an email shortly.'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                //navigate to multiformpage
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MultiFormPage()));
                              },
                              child: Text('OK'))
                        ],
                      );
                    }
                  });
            },
            child: Text('Confirm booking'))
      ],
    );
  }
}
