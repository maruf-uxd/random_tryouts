import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_tryouts/components/rounded_button.dart';
import 'package:random_tryouts/components/rounded_input_field.dart';
import 'package:random_tryouts/screens/courses_home_screen/components/background.dart';
import 'package:random_tryouts/utils/helper.dart';

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

    void getInputFromDialog() async {
      TextEditingController _testInputText = TextEditingController();
      var result = await showDialog(
        context: context,useSafeArea: true,
        builder: (context) => Dialog(
          backgroundColor: Color(0xFFEFEFEF),
          child: Container(
            width: size.width * 0.7,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // RoundedInputField(hintText: "hintText", onChanged: (value) {}),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: _testInputText,
                    onChanged: (value) {},
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      ),
                      labelText: "Type anything",
                      hintText: "Type anything",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context, {"test": "canceled"});
                      },
                      icon: Icon(Icons.cancel),
                      color: Colors.red,
                      iconSize: 40,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context, {"test": _testInputText.text});
                      },
                      icon: Icon(Icons.done),
                      color: Colors.green,
                      iconSize: 40,
                    ),
                  ],
                ),
                // const SizedBox(height: 10),
                // RoundedButton(
                //   text: "Submit",
                //   buttonSize: 0.4,
                //   press: () {
                //     Navigator.pop(context, {"test": _testInputText.text});
                //   },
                // )
              ],
            ),
          ),
        ),
      );

      print(result);
      if (result != null && result["test"].toString().isNotEmpty) {
        Helper.toast(context, result["test"]);
      }
    }

    return Background(
      child: SingleChildScrollView(
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
                          onTap: () => Navigator.pop(context),
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
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white30,
                child: Column(
                  children: [
                    RoundedButton(
                      press: () {
                        getInputFromDialog();
                      },
                      text: 'Popup Input',
                      color: Color(0xFFF7F7FA),
                      textColor: Colors.blue,
                    ),
                    Container(
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFF7F7FA),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 40,
                              width: size.width * 0.78,
                              child: GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  // color: Colors.blueGrey,
                                  child: Row(
                                    children: const [
                                      Expanded(
                                        child: Text(
                                          "test",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  getInputFromDialog();
                                },
                                onLongPress: () {
                                  Helper.toast(context, "It's a button", 2, Colors.blueGrey);
                                },
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.65,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: size.width * 0.78,
                              child: GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  // color: Colors.blueGrey,
                                  child: Row(
                                    children: const [
                                      Expanded(
                                        child: Text(
                                          "Gesture",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Helper.toast(context, "Double tap", 1, Colors.blueGrey);
                                },
                                onDoubleTap: () {
                                  Helper.toast(context, "Long press", 1, Colors.greenAccent);
                                },
                                onLongPress: () {
                                  Helper.toast(context, "Single Tap", 1, Colors.blue);
                                },
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.65,
                              child: Row(
                                children: const [
                                  Expanded(
                                    child: Divider(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: size.width * 0.78,
                              child: GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  // color: Colors.blueGrey,
                                  child: Row(
                                    children: const [
                                      Expanded(
                                        child: Text(
                                          "Sleeping...",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Helper.toast(context, "Sleepy is sleeping...");
                                },
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                    RoundedButton(
                      press: () {
                        getInputFromDialog();
                      },
                      text: 'Popup Input',
                      color: Color(0xFFF7F7FA),
                      textColor: Colors.blue,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
