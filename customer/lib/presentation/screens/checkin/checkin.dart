// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:ui';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:customer/constants/images.dart';
import 'package:customer/constants/textstyles.dart';
import 'package:customer/presentation/widgets/buttons/commonbutton.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../../widgets/scannerbracketpainter.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({super.key});

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  final MobileScannerController scannerController = MobileScannerController(
    autoStart: false,
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  bool scanning = false;
  Map<String, dynamic>? qrCodeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Connect with your stay",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('Scan the QR code to connect with the stay',
                        style: CustomTextStyles.subHeading(color: qrCodeData == null
                              ? const Color(0xB2555555)
                              : Colors.transparent,)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomPaint(
                      foregroundPainter:
                          qrCodeData == null ? ScannerBracketPainter() : null,
                      child: qrCodeData == null
                          ? Container(
                              width: 273,
                              height: 273,
                              margin: const EdgeInsets.all(10),
                              child: ClipRRect(
                                  borderRadius: SmoothBorderRadius(
                                      cornerRadius: 10, cornerSmoothing: 10),
                                  child: MobileScanner(
                                    fit: BoxFit.cover,
                                    placeholderBuilder: (p0, p1) => Image.asset(
                                      'assets/qrcode.png',
                                      width: 155.64,
                                      height: 155.64,
                                    ),
                                    scanWindow: Rect.largest,
                                    errorBuilder: (p0, p1, p2) => Container(
                                      color: Colors.blue,
                                      child: Text(
                                          p1.errorDetails!.message.toString()),
                                    ),
                                    controller: scannerController,
                                    // Image.asset('assets/qrcode.png'),
                                    onDetect: (capture) {
                                      final Barcode barcode =
                                          capture.barcodes.first;
                                      if (barcode.rawValue != null) {
                                        debugPrint(
                                            'Barcode found! ${barcode.rawValue}');
                                            
                                        var jsonData =
                                            json.decode(barcode.rawValue!);
                                        print(jsonData['name']);
                                        print(jsonData['phone']);
                                        print(jsonData['room']);
                                        print(jsonData['property_id']);

                                        /// callback to create a user/login and get access token.
                                      }
                                    },
                                  )),
                            )
                          : Card(
                              shape: SmoothRectangleBorder(
                                borderRadius:
                                    SmoothBorderRadius(cornerRadius: 10),
                              ),
                              elevation: 4,
                              shadowColor: const Color.fromRGBO(0, 0, 0, 0.247),
                              child: Container(
                                width: 273,
                                height: 273,
                                margin: const EdgeInsets.all(10),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    // Blurred QR Code Image
                                    Positioned.fill(
                                      child: Padding(
                                        padding: const EdgeInsets.all(13),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 0, sigmaY: 0),
                                          child: Image.asset(
                                            'assets/qrcode.png',
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 0.1),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Widget to show on top
                                    Positioned(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Image.asset(
                                                Images.check_green,
                                                width: 100,
                                                height: 100,
                                              ),
                                            ),
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Connected ',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          59, 164, 101, 1),
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  'with the stay',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                ],
              ),
              if (!scanning)
                CommonButton(
                    onPressed: () {
                      setState(() {
                        scanning = true;
                      });
                      scannerController.stop();
                      scannerController.start();



                      // Future.delayed(const Duration(seconds: 2)).then((value) {
                      //   setState(() {
                      //     qrCodeData = {
                      //       'name': 'Hemant Thanna',
                      //       'phone': 9340765396,
                      //       'room': 201,
                      //       'property_id': 234543
                      //     };
                      //   });
                      // }).then((value) {
                      //   Future.delayed(const Duration(seconds: 2))
                      //       .then((value) {
                      //     Navigator.pushNamedAndRemoveUntil(
                      //         context, '/', (route) => false);
                      //   });
                      // });
                    },
                    lable: 'Start Scanning')
            ],
          ),
        ),
      ),
    );
  }
}
