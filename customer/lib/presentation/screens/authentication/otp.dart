import 'package:customer/constants/textstyles.dart';
import 'package:customer/middleware/helpers/storage.utils.dart';
import 'package:customer/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/localstorage.keys.dart';
import '../../../middleware/blocs/authentication/auth_cubit.dart';
import '../../widgets/buttons/commonbutton.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);

    final defaultPinTheme = PinTheme(
      width: 46.33,
      height: 48,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0x33565656)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Guest Login",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
            child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.obj != null && state.obj!.accessToken != null) {
              if (state.obj!.newUser! == true) {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/registername", (route) => false);
              } else {
                LocalStorage.read(key: LocalStorageKeys.accessToken)
                    .then((value) {
                  print(value);
                });
                Navigator.pushNamedAndRemoveUntil(
                    context, "/home", (route) => false);
              }
            }
          },
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("OTP verification",
                              style: CustomTextStyles.title()),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Enter the OTP sent to xxxxxxxxxx ",
                                style: CustomTextStyles.body(),
                              ),
                              const Icon(Icons.short_text_rounded)
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      child: Pinput(
                        controller: pinController,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        focusNode: focusNode,
                        length: 6,
                        androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: defaultPinTheme,
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {},
                        onChanged: (value) {},
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 1,
                              color: focusedBorderColor,
                            ),
                          ],
                        ),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: const Color.fromRGBO(243, 246, 249, 0),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                    ),
             
                    
                    CommonButton(
                      margin: const EdgeInsets.all(0),
                      onPressed: () {
                        if (pinController.length == 6) {
                          context
                              .read<AuthCubit>()
                              .loginWithOtp(pinController.text);
                        }
                      },
                      width: double.infinity,
                      lable: 'Verify & continue',
                    ),
                    SizedBox(
                      height: 24,
                    ),
                           Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Didn\'t receive OTP?',
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.body()),
                        const SizedBox(width: 2),
                        GestureDetector(
                          onTap: () {
                            /// TODO: implement resend OTP
                          },
                          child: Text('Resend OTP',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.body(
                                  color: const Color(0xFF3BA365))),
                        ),
                      ],
                    ),
                  ],
                ),
                if (state.loading != null && state.loading == true) ...[
                  const Loading()
                ]
              ],
            );
          },
        )),
      ),
    );
  }
}
