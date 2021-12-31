import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_tryouts/screens/courses_home_screen/components/background.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // color: Colors.white70,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Image.asset("assets/images/back_button.png"),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   style: ElevatedButton.styleFrom(
                      //     shape: CircleBorder(),
                      //     padding: EdgeInsets.all(12),
                      //     primary: Colors.white70,
                      //   ),
                      //   child: Icon(
                      //     Icons.chevron_left,
                      //     color: Colors.pink,
                      //     size: 24.0,
                      //     semanticLabel: 'go back',
                      //   ),
                      // ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 5.0, spreadRadius: 2.0, color: Colors.grey.shade800)],
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.grey.shade200,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        "assets/images/pro_pic.png",
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "Robert Fox",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFF00ADF6),
                            Color(0xFFFF00B8),
                          ],
                        ).createShader(
                          Rect.fromLTWH(0.0, 0.0, 90.0, 50.0),
                        ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Proficient",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "(Level: 56)",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white30,
              child: Column(
                children: [
                  Text(
                    "Work in progress",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
