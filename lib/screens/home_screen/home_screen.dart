import 'package:flutter/material.dart';
import 'package:random_tryouts/components/rounded_button.dart';
import 'package:random_tryouts/screens/home_screen/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

