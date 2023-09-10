import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

import '../../widgets/commonbutton.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  TextEditingController _text = TextEditingController();
  bool qrcodefound = false;
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Connect with your stay",
          style: GoogleFonts.lato(
            color: const Color(0xB2555555),
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.28,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Scan the QR code to connect with stay',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: const Color(0xB2555555),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                color: qrcodefound ? Colors.red : Colors.yellow,
                width: 300,
                height: 300,
                child: QRCodeDartScanView(
                  onCapture: (value) {
                    setState(() {
                      qrcodefound = true;
                    });
                  },
                ),
              )
              // MobileScanner(
              //   controller: MobileScannerController(
              //     detectionSpeed: DetectionSpeed.noDuplicates,
              //   ),
              //   onDetect: (capture) {
              //     final List<Barcode> barcodes = capture.barcodes;
              //     final Uint8List? image = capture.image;
              //     for (final barcode in barcodes) {
              //       debugPrint('Barcode found! ${barcode.rawValue}');
              //     }
              //   },
              // )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Enter your room n0.'),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 328),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _validate = false;
                    });
                  },
                  maxLength: 10,
                  controller: _text,
                  decoration: InputDecoration(
                    errorText:
                        _validate ? "please enter available room no." : null,
                    prefixStyle: GoogleFonts.nunito(
                      color: const Color(0x99565656),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.25,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 0.50,
                        color: Color(0x33565656),
                      ),
                    ),
                  ),
                ),
              ),
              CommonButton(
                onPressed: () {
                  setState(() {
                    if (_text.text.isEmpty || _text.text.length != 10) {
                      print(_text.text.length);
                      _validate = true;
                    } else {
                      _validate = false;
                    }
                  });
                  if (!_validate) {
                    // context.read<AuthCubit>().getOTP(_text.text);
                    // update room no. here
                  }
                  Navigator.pushNamed(context, "/home");
                },
                borderradius: 4,
                height: 48,
                margin: const EdgeInsets.symmetric(vertical: 18),
                width: 300,
                lable: "Confirm",
              )
            ],
          )
        ],
      ),
    );
  }
}
