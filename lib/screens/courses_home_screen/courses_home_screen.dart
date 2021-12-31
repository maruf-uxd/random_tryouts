import 'package:flutter/material.dart';
import 'package:random_tryouts/screens/courses_home_screen/components/body.dart';

class CoursesHomeScreen extends StatelessWidget {
  const CoursesHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
