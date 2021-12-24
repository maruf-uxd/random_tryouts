import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:random_tryouts/components/rounded_button.dart';
import 'package:random_tryouts/screens/ip_details_screen//components/background.dart';
import 'package:random_tryouts/utils/helper.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _isSpinner = false;
  var ipDetailsData = "";

  Future<void> getIpDetails() async {
    _isSpinner = true;
    var dio = Dio();
    final response = await dio.get('http://ip-api.com/json');
    // final response = await dio.get('http://ip-api.com/json/54.168.1.247?fields=66842623&lang=en');
    _isSpinner = false;
    ipDetailsData = response.data.toString();

    (response.data).toString().contains("countryCode: JP")
        ? {
            LocaleNotifier.of(context)!.change('jp'),
            Helper.toast(context, "You are inside JP", 2, Colors.green),
          }
        : {
            LocaleNotifier.of(context)!.change('en'),
            Helper.toast(context, "you are outside JP"),
          };

    setState(() {
      ipDetailsData;
    });
    print(response.data);
  }

  @override
  void initState() {
    // TODO: implement initState
    getIpDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                ipDetailsData,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Center(
              child: Visibility(
                visible: _isSpinner,
                child: const SpinKitSquareCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
