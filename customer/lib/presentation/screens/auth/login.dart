import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../middleware/blocs/authentication/auth_cubit.dart';
import '../../widgets/buttons/commonbutton.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController phoneNumber = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
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
      body: Center(child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Text(
                          "Enter your Phone number",
                          style: GoogleFonts.lato(
                              color: const Color(0xE5555555),
                              letterSpacing: -0.72,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Text(
                          'We will send you a 6 digit verification code',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: const Color(0xB2555555),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _validate = false;
                        });
                      },
                      maxLength: 10,
                      controller: phoneNumber,
                      decoration: InputDecoration(
                        errorText:
                            _validate ? "please enter 10 numbers" : null,
                        prefixText: "+91",
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
                  // Container(
                  //   margin: const EdgeInsets.symmetric(vertical: 5),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         'Don\'t have an account?',
                  //         textAlign: TextAlign.center,
                  //         style: GoogleFonts.lato(
                  //           color: const Color(0xB2555555),
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //       TextButton(
                  //         onPressed: () {
                  //           Navigator.pushReplacementNamed(context, '/');
                  //         },
                  //         child: Text(
                  //           ' Register',
                  //           textAlign: TextAlign.center,
                  //           style: GoogleFonts.lato(
                  //             color: const Color(0xFF3BA365),
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w500,
                  //             letterSpacing: -0.42,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  BlocConsumer<AuthCubit, AuthState>(
                    // buildWhen: (previous, current) {
                    //   if (previous.otpSent == current.otpSent) {
                    //     return true;
                    //   } else {
                    //     return false;
                    //   }
                    // },
                    listener: (context, state) {
                      if (state.otpSent!) {
                        Navigator.pushNamed(context, "/otp");
                      }
                    },
                    builder: (context, state) {
                      return CommonButton(
                        onPressed: () {
                          setState(() {
                            if (phoneNumber.text.isEmpty ||
                                phoneNumber.text.length != 10) {
                              _validate = true;
                            } else {
                              _validate = false;
                            }
                          });
                          if (!_validate) {
                            context
                                .read<AuthCubit>()
                                .getOTP(phoneNumber.text);
                          }
                        },
                        borderradius: 4,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        lable: "Generate OTP",
                      );
                    },
                  )
                ],
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
