import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/util/utilwidget.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';
import 'package:partner/middleware/auth_cubit.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, required this.phoneNumber});
  String phoneNumber;

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
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color(0x33565656);

    final defaultPinTheme = PinTheme(
      width: 39,
      height: 48,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Guest Login",
          style: GoogleFonts.lato(
            color: const Color(0xB2555555),
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.28,
          ),
        ),
      ),
      body: Center(
          child: BlocConsumer<AuthCubit, AuthInitial>(
        listener: (context, state) {
          if (state.obj != null && state.obj!.accessToken != "") {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/home",
              (route) => false,
            );
          }
          if (state.messaage != null) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.messaage!)));
          }
        },
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 29,
                            child: Text(
                              "OTP verification",
                              style: GoogleFonts.lato(
                                  color: const Color(0xE5555555),
                                  letterSpacing: -0.72,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 270,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Enter the OTP sent to +91${widget.phoneNumber}",
                                  style: GoogleFonts.lato(
                                    color: const Color(0xB2555555),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.28,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, "/", (route) => false);
                                  },
                                  child: const Icon(
                                    Icons.edit_outlined,
                                    color: Color(0xB2555555),
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      child: Pinput(
                        controller: pinController,
                        focusNode: focusNode,
                        length: 6,
                        androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: defaultPinTheme,
                        validator: (value) {
                          if (value == '123456') {
                            // use navigator here to route to new page
                          }
                          return value!.length == 6 ? null : 'Pin is incorrect';
                        },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {
                          debugPrint('onCompleted: $pin');
                        },
                        onChanged: (value) {
                          debugPrint('onChanged: $value');
                        },
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
                            color: fillColor,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Didn’t receive OTP?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              color: const Color(0xB2555555),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 2),
                          InkWell(
                            onTap: () {
                              context
                                  .read<AuthCubit>()
                                  .getOTP(widget.phoneNumber);
                              errorSnackBar(context, "OTP sent");
                            },
                            child: Text(
                              'Resend OTP',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                color: const Color(0xFF3BA365),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.42,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GradientCommonButton(
                      function: () {
                        if (pinController.length == 6) {
                          // if (pinController.text == "123456") {
                          //   Navigator.pushNamed(context, "/home");
                          // }
                          context
                              .read<AuthCubit>()
                              .loginWithOtp(pinController.text);
                        } else {
                          setState(() {});
                        }
                      },
                      borderradius: 4,
                      height: 48,
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      width: 300,
                      lable: 'Verify & continue',
                    )
                  ],
                ),
              ),
              if (state.loading != null && state.loading == true) ...[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white60,
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
              ]
            ],
          );
        },
      )),
    );
  }
}
