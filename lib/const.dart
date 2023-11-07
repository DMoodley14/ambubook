import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

TextStyle kFormHeading(context) {
  return TextStyle(
      fontSize: ResponsiveValue<double>(context, conditionalValues: [
        const Condition.equals(name: MOBILE, value: 16),
        const Condition.equals(name: TABLET, value: 18),
        const Condition.equals(name: DESKTOP, value: 20),
        const Condition.equals(name: '4K', value: 22)
      ]).value,
      fontWeight: FontWeight.bold);
}

TextStyle kFormFields(context) {
  return TextStyle(
    fontSize: ResponsiveValue<double>(context, conditionalValues: [
      const Condition.equals(name: MOBILE, value: 12),
      const Condition.equals(name: TABLET, value: 13),
      const Condition.equals(name: DESKTOP, value: 14),
      const Condition.equals(name: '4K', value: 16)
    ]).value,
  );
}

TextStyle kFormButton(context) {
  return TextStyle(
      fontSize: ResponsiveValue<double>(context, conditionalValues: [
        const Condition.equals(name: MOBILE, value: 14),
        const Condition.equals(name: TABLET, value: 14),
        const Condition.equals(name: DESKTOP, value: 16),
        const Condition.equals(name: '4K', value: 18)
      ]).value,
      fontWeight: FontWeight.w600);
}

TextStyle kSummary(context) {
  return TextStyle(
      fontSize: ResponsiveValue<double>(context, conditionalValues: [
    const Condition.equals(name: MOBILE, value: 12),
    const Condition.equals(name: TABLET, value: 14),
    const Condition.equals(name: DESKTOP, value: 15),
    const Condition.equals(name: '4K', value: 22)
  ]).value);
}

TextStyle kSummaryHeading(context) {
  return TextStyle(
      fontSize: ResponsiveValue<double>(context, conditionalValues: [
        const Condition.equals(name: MOBILE, value: 14),
        const Condition.equals(name: TABLET, value: 15),
        const Condition.equals(name: DESKTOP, value: 17),
        const Condition.equals(name: '4K', value: 22)
      ]).value,
      fontWeight: FontWeight.bold);
}

TextStyle kLoginHeading(context) {
  return TextStyle(
      fontSize: ResponsiveValue<double>(context, conditionalValues: [
        const Condition.equals(name: MOBILE, value: 20),
        const Condition.equals(name: TABLET, value: 24),
        const Condition.equals(name: DESKTOP, value: 30),
        const Condition.equals(name: '4K', value: 36)
      ]).value,
      fontWeight: FontWeight.bold);
}





//login textfield
//login Heading
//login subheading
//Login elevated button
//login text button
//form buttons
//form dropdown
//form textfields