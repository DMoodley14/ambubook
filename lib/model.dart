class BookingModel {
  String fromFacility;
  String fromWard;
  String station;
  String toFacility;
  String toWard;
  String acceptingDoctor;
  String acceptingDoctorContact;
  String referringDoctor;
  String referringDoctorContact;
  String patientFileNo;
  String age;
  String diagnosis;
  String category;
  String HR;
  String BP;
  String sats;
  String temp;
  String GCS;
  String HGT;
  String specialConsiderations;
  BookingModel({
    required this.fromFacility,
    required this.fromWard,
    required this.station,
    required this.toFacility,
    required this.toWard,
    required this.acceptingDoctor,
    required this.acceptingDoctorContact,
    required this.referringDoctor,
    required this.referringDoctorContact,
    required this.patientFileNo,
    required this.age,
    required this.diagnosis,
    required this.category,
    required this.HR,
    required this.BP,
    required this.sats,
    required this.temp,
    required this.GCS,
    required this.HGT,
    required this.specialConsiderations,
  });
}
