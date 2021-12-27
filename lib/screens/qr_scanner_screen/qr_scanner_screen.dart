import 'package:flutter/material.dart';
import 'package:random_tryouts/screens/qr_scanner_screen/components/body.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
