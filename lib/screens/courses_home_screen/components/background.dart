import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                  // Color(0xFF2855AE),
                  // Color(0xFF7292CF),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: FittedBox(
              child: Image.asset(
                "assets/images/squared_loops.png",
              ),
              fit: BoxFit.fitWidth,
              // child: SvgPicture.asset(
              //   "assets/images/circular_loops.svg",
              //   width: size.width,
              // ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FittedBox(
              child: Image.asset(
                "assets/images/circular_loops.png",
              ),
              fit: BoxFit.fitWidth,
              // child: SvgPicture.asset(
              //   "assets/images/circular_loops.svg",
              //   width: size.width,
              // ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
