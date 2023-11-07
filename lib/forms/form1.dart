import 'package:ambubook/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Form1 extends StatefulWidget {
  Form1({required this.stationController});

  final TextEditingController stationController;

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  String selectedValue = "Please select your station";
  List<String> dropdownValues = [];

  @override
  void initState() {
    super.initState();
    fetchDropdownValues();
  }

  Future<void> fetchDropdownValues() async {
    // Replace 'your-collection' with your actual Firestore collection name
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('station_list').get();

    List<String> values = [];
    snapshot.docs.forEach((doc) {
      values.add(
          doc.get('StationName')); // Retrieve the 'value' field from Firestore
    });

    setState(() {
      dropdownValues = values;
    });
  }

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
            "Please choose your facility's EMS station:",
            style: kFormHeading(context),
          ),
          SizedBox(height: 26.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: DropdownButton<String>(
              value: selectedValue,
              hint: Text('Select a value'),
              //style the dropdown button to have outline borders all 4
              //sides and a white background

              dropdownColor: Colors.white,
              elevation: 0,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 36,
              underline: null,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),

              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                  widget.stationController.text = selectedValue;
                });
              },
              items:
                  dropdownValues.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
