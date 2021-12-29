import 'package:flutter/material.dart';
import 'package:random_tryouts/screens/test_screen/contentes/body.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
