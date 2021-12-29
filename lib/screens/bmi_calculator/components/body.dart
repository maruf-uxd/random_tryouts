import 'package:flutter/material.dart';
import 'package:random_tryouts/components/rounded_button.dart';
import 'package:random_tryouts/screens/bmi_calculator/background_design/left_bar.dart';
import 'package:random_tryouts/screens/bmi_calculator/background_design/right_bar.dart';
import 'package:random_tryouts/screens/bmi_calculator/components/background.dart';
import 'package:random_tryouts/utils/constants.dart';
import 'package:random_tryouts/utils/helper.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  void calculateBMI(height, weight) {
    height = height / 100.0;
    _bmiResult = weight / (height * height);
    _textResult = _bmiResult.toStringAsFixed(2);
    if(_bmiResult > 25){
      _textResult = "You\'re over weight";
    } else if(_bmiResult >= 18.5 && _bmiResult <= 25){
      _textResult = "You have normal weight";
    }else{
      _textResult = "You\'re under weight";
    }
    setState(() {
      _textResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "BMI Calculator",
                      style: TextStyle(fontSize: 50, color: accentHexColor),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 130,
                        child: TextField(
                          controller: _heightController,
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(fontSize: 42, fontWeight: FontWeight.w300, color: Color(0xFFFCC91C)),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Height",
                            hintStyle: TextStyle(fontSize: 42, fontWeight: FontWeight.w300, color: Colors.white.withOpacity(.4)),
                          ),
                        ),
                      ),
                      Container(
                        width: 130,
                        child: TextField(
                          controller: _weightController,
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.done,
                          style: const TextStyle(fontSize: 42, fontWeight: FontWeight.w300, color: Color(0xFFFCC91C)),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Weight",
                            hintStyle: TextStyle(fontSize: 42, fontWeight: FontWeight.w300, color: Colors.white.withOpacity(.4)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 130,
                        child: const Text(
                          "in cm",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xFFFCC91C)),
                        ),
                      ),
                      Container(
                        width: 130,
                        child: const Text(
                          "in kg",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xFFFCC91C)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RoundedButton(
                    text: "Calculate",
                    color: const Color(0x6cFCC91C),
                    press: () {
                      if (_heightController.text.isEmpty || _weightController.text.isEmpty) {
                        Helper.toast(context, "Field required", 2, Colors.redAccent);
                      } else {
                        calculateBMI(double.parse(_heightController.text), double.parse(_weightController.text));
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    _bmiResult == 0 ? "(0)" : "(${_bmiResult.toStringAsFixed(2)})",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor,
                    ),
                  ),
                  Text(
                    _textResult.isEmpty ? "Eat Healthy" : _textResult,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor,
                    ),
                  ),
                  const Center(
                    child: Text(
                      "\"an apple a day, keeps the doctor away\"",
                      style: TextStyle(color: accentHexColor),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        SizedBox(height: 100),
                        RightBar(barWidth: 50),
                        SizedBox(height: 10),
                        RightBar(barWidth: 20),
                        SizedBox(height: 10),
                        LeftBar(barWidth: 50),
                        SizedBox(height: 10),
                        LeftBar(barWidth: 20),
                        SizedBox(height: 10),
                        RightBar(barWidth: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
