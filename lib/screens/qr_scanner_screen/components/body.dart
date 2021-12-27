import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:random_tryouts/screens/ip_details_screen//components/background.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver('#ff6666', 'Cancel', true, ScanMode.BARCODE)!.listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Container(
            alignment: Alignment.center,
            child: Flex(direction: Axis.vertical, mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              // ElevatedButton(
              //     onPressed: () => scanBarcodeNormal(),
              //     child: Text('Start barcode scan')),
              ElevatedButton(onPressed: () => scanQR(), child: Text('Start QR scan')),
              // ElevatedButton(
              //     onPressed: () => startBarcodeScanStream(),
              //     child: Text('Start barcode scan stream')),
              Text('Scan result : $_scanBarcode\n', style: TextStyle(fontSize: 20)),
              Text(
                (_scanBarcode.length == 12 && _scanBarcode.contains("UXD-")) ? "Pattern Matched" : "Pattern did not Matched",
                style: TextStyle(
                  color: (_scanBarcode.length == 12 && _scanBarcode.contains("UXD-")) ? Colors.green : Colors.red,
                  fontSize: 30,
                ),
              )
            ])));
  }
}
