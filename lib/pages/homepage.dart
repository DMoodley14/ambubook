import 'package:ambubook/model.dart';
import 'package:ambubook/widgets.dart/summaryWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../const.dart';
import '../forms/form0.dart';
import '../forms/form1.dart';
import '../forms/form2.dart';
import '../forms/form3.dart';
import '../forms/form4.dart';
import '../forms/form5.dart';
import '../widgets.dart/formWidgets.dart';

BookingModel bookingModel = BookingModel(
    toFacility: "",
    toWard: "",
    station: "",
    fromFacility: "",
    fromWard: "",
    acceptingDoctor: "",
    acceptingDoctorContact: "",
    referringDoctor: "",
    referringDoctorContact: "",
    patientFileNo: "",
    age: "",
    diagnosis: "",
    category: "",
    HR: "",
    BP: "",
    sats: "",
    temp: "",
    GCS: "",
    HGT: "",
    specialConsiderations: "");
final TextEditingController fromFacilityController = TextEditingController();
final TextEditingController fromWardController = TextEditingController();
final TextEditingController stationController = TextEditingController();
final TextEditingController toFacilityController = TextEditingController();
final TextEditingController toWardController = TextEditingController();

final TextEditingController acceptingDoctorController = TextEditingController();
final TextEditingController acceptingDoctorContactController =
    TextEditingController();
final TextEditingController referringDoctorController = TextEditingController();
final TextEditingController referringDoctorContactController =
    TextEditingController();
final TextEditingController patientFileNoController = TextEditingController();
final TextEditingController ageController = TextEditingController();
final TextEditingController diagnosisController = TextEditingController();
final TextEditingController categoryController = TextEditingController();
final TextEditingController HRController = TextEditingController();
final TextEditingController BPController = TextEditingController();
final TextEditingController satsController = TextEditingController();
final TextEditingController tempController = TextEditingController();
final TextEditingController GCSController = TextEditingController();
final TextEditingController HGTController = TextEditingController();
final TextEditingController specialConsiderationsController =
    TextEditingController();

late String email = "";

class MultiFormPage extends StatefulWidget {
  @override
  _MultiFormPageState createState() => _MultiFormPageState();
}

class _MultiFormPageState extends State<MultiFormPage> {
  int currentFormIndex = 0;
  List<Widget> forms = [
    Form0(),
    Form1(stationController: stationController),
    Form2(
      fromFacilityController: fromFacilityController,
      fromWardController: fromWardController,
    ),
    Form3(
        toFacilityController: toFacilityController,
        toWardController: toWardController),
    Form4(
      acceptingDoctorNameController: acceptingDoctorController,
      acceptingDoctorNumberController: acceptingDoctorContactController,
      referringDoctorNameController: referringDoctorController,
      referringDoctorNumberController: referringDoctorContactController,
    ),
    Form5(
        patientFileNoController: patientFileNoController,
        ageController: ageController,
        diagnosisController: diagnosisController,
        categoryController: categoryController,
        heartRateController: HRController,
        bpController: BPController,
        satsController: satsController,
        tempController: tempController,
        gcsController: GCSController,
        hgtController: HGTController,
        specialConsiderationsController: specialConsiderationsController),
  ];
//Uses the station name to fetch the station email from the database
  Future<void> fetchStationEmail(String name) async {
    try {
      final QuerySnapshot<Map<String, dynamic>>
          snapshot = await FirebaseFirestore.instance
              .collection('station_list')
              .where(
                  'StationName',
                  isEqualTo:
                      name) // Access the stationName from widget parameter
              .get();

      if (snapshot.docs.isNotEmpty) {
        final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            snapshot.docs.first;
        final data = documentSnapshot.data();
        if (data != null && data.containsKey('StationEmail')) {
          setState(() {
            email = data['StationEmail'] as String;
            print(email);
          });
        }
      }
    } catch (e) {
      print('Error fetching station email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 700) {
          // Phone layout
          return HomePageMobile(
            form: multiformMethod(context),
          );
        } else {
          // Web layout
          return HomePageWeb(
            form: Flexible(
                flex: 3, fit: FlexFit.tight, child: multiformMethod(context)),
          );
        }
      },
    );
  }

  Center multiformMethod(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveValue<double>(context, conditionalValues: [
            const Condition.equals(name: MOBILE, value: 20),
            const Condition.equals(name: TABLET, value: 40),
            const Condition.equals(name: DESKTOP, value: 100),
            const Condition.equals(name: '4K', value: 140)
          ]).value!,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            forms[currentFormIndex],
            SizedBox(
                height: ResponsiveValue<double>(context, conditionalValues: [
              const Condition.equals(name: MOBILE, value: 20),
              const Condition.equals(name: TABLET, value: 10),
              const Condition.equals(name: DESKTOP, value: 30),
              const Condition.equals(name: '4K', value: 40)
            ]).value!),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: currentFormIndex == 0 ? false : true,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentFormIndex--;
                      });
                    },
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(100, 50)),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.primaryContainer)),
                    child: Text(
                      'Back',
                      style: kFormButton(context),
                    ),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (currentFormIndex == 5) {
                          fetchStationEmail(stationController.text);

                          bookingModel.patientFileNo =
                              patientFileNoController.text;
                          bookingModel.age = ageController.text;
                          bookingModel.diagnosis = diagnosisController.text;
                          bookingModel.category = categoryController.text;
                          bookingModel.HR = HRController.text;
                          bookingModel.BP = BPController.text;
                          bookingModel.sats = satsController.text;
                          bookingModel.temp = tempController.text;
                          bookingModel.GCS = GCSController.text;
                          bookingModel.HGT = HGTController.text;
                          bookingModel.specialConsiderations =
                              specialConsiderationsController.text;

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return BookingSummaryPopup(
                                  model: bookingModel,
                                  email: email,
                                );
                              });
                        } else {
                          currentFormIndex++;
                          bookingModel.fromFacility =
                              fromFacilityController.text;
                          bookingModel.fromWard = fromWardController.text;
                          bookingModel.station = stationController.text;
                          bookingModel.toFacility = toFacilityController.text;
                          bookingModel.toWard = toWardController.text;
                          bookingModel.acceptingDoctor =
                              acceptingDoctorController.text;
                          bookingModel.acceptingDoctorContact =
                              acceptingDoctorContactController.text;
                          bookingModel.referringDoctor =
                              referringDoctorController.text;
                          bookingModel.referringDoctorContact =
                              referringDoctorContactController.text;
                          bookingModel.patientFileNo =
                              patientFileNoController.text;

                          //
                        }
                      });
                    },
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(100, 50)),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.primaryContainer)),
                    child: Text(
                      'Proceed',
                      style: kFormButton(context),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: ResponsiveValue<double>(context, conditionalValues: [
              const Condition.equals(name: MOBILE, value: 20),
              const Condition.equals(name: TABLET, value: 10),
              const Condition.equals(name: DESKTOP, value: 0),
              const Condition.equals(name: '4K', value: 0)
            ]).value!)
          ],
        ),
      ),
    );
  }
}
