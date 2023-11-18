import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

import '../middleware/blocs/authentication/auth_cubit.dart';
import '../presentation/widgets/buttons/commonbutton.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  TextEditingController roomNumberController = TextEditingController();
  TextEditingController propertyController = TextEditingController();
  bool qrcodefound = false;
  bool _validate = false;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        backgroundColor:  const Color.fromRGBO(245, 245, 245, 1),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                const Text('Enter your room no.'),
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
                    controller: roomNumberController,
                    decoration: InputDecoration(
                      errorText:
                          _validate ? "please enter available room no" : null,
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
                  onPressed: () async {
                    if (!loading) {
                      setState(() {
                        if (roomNumberController.text.isEmpty) {
                          _validate = true;
                        } else {
                          _validate = false;
                        }
                      });
                      if (!_validate) {
                        print('about to call updateUserDetails function');
                        context
                            .read<AuthCubit>()
                            .updateUserDetails(
                              roomNumber:  roomNumberController.text,
                              providerid: 
                              '123456',
                            )
                            .then((value) {
                          if (value) {
                            setState(() {
                              loading = false;
                            });
                            Navigator.pushReplacementNamed(context, "/");
                          }
                        });
                      }
                    }
                  },
                  borderradius: 4,
                  height: 48,
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  width: 300,
                  lable: "Confirm",
                  child: loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : null,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
