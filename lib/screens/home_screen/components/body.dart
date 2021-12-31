import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:random_tryouts/components/rounded_button.dart';
import 'package:random_tryouts/screens/bmi_calculator/bmi_calculator_screen.dart';
import 'package:random_tryouts/screens/courses_home_screen/courses_home_screen.dart';
import 'package:random_tryouts/screens/home_screen/components/background.dart';
import 'package:random_tryouts/screens/ip_details_screen/ip_details_screen.dart';
import 'package:random_tryouts/screens/qr_scanner_screen/qr_scanner_screen.dart';
import 'package:random_tryouts/screens/test_screen/test_screen.dart';
import 'package:random_tryouts/utils/helper.dart';

int count = 0;

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void changeLocalization() {
      print(count);
      if (count % 2 == 0) {
        Helper.toast(context, "Language changed to \"Japanese\'", 2, Colors.green);
        LocaleNotifier.of(context)!.change('jp');
      } else {
        Helper.toast(context, "Language changed to \"English\'", 2, Colors.green);
        LocaleNotifier.of(context)!.change('en');
      }
      count += 1;
      setState(() {
        count;
      });
    }

    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.1,
              width: size.width * 0.4,
              child: const FittedBox(
                child: LocaleText(
                  "welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 60,
              width: size.width * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  ),
                  onPressed: () {
                    // Helper.toast(context, "\"IP details\" work in progress", 2, Colors.blue);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IPDetailsScreen(),
                      ),
                    );
                  },
                  child: const FittedBox(
                    child: LocaleText(
                      "ipDetails",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            RoundedButton(
              text: "QR Scan",
              press: () {
                // Helper.toast(context, "\"QR Scan\" work in progress", 2, Colors.blue);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QRScreen()),
                );
              },
            ),
            RoundedButton(
              text: "Localization",
              press: () {
                changeLocalization();
              },
            ),
            RoundedButton(
              text: "Course Home",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CoursesHomeScreen(),
                  ),
                );
              },
            ),
            RoundedButton(
              text: "BMI Calculator",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BMICalculatorScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
