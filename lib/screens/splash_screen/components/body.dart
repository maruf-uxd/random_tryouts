import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:random_tryouts/screens/splash_screen/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        height: size.height,
        width: double.infinity,
        // color: Colors.greenAccent,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF2855AE),
              Color(0xFF7292CF),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 6,
            ),
            Container(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: size.height * 0.25,
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/splash_intro_art.png",
                    width: size.width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
