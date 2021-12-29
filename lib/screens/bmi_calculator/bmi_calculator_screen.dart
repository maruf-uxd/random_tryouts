import 'package:flutter/material.dart';
import 'package:random_tryouts/screens/bmi_calculator/components/body.dart';

class BMICalculatorScreen extends StatelessWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1c1c1c),
      body: Body(),
    );
  }
}
