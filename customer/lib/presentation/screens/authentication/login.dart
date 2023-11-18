import 'package:customer/constants/textstyles.dart';
import 'package:customer/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(
        title: const Text(
          "Guest Login",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("Enter your Phone number",
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.title()),
                          const SizedBox(
                            height: 4,
                          ),
                          Text('We will send you a 6 digit verification code',
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.body()),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      width: double.infinity,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        autofillHints: const [AutofillHints.telephoneNumberNational],
                        onChanged: (value) {
                          setState(() {
                            _validate = false;
                          });
                        },
                        maxLength: 10,
                        controller: phoneNumber,
                        decoration: InputDecoration(
                          counterText: '',
                          errorText:
                              _validate ? "please enter 10 numbers" : null,
                          prefixText: "+91",
                        ),
                      ),
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state.otpSent!) {
                          Navigator.pushNamed(context, "/otp");
                        }
                      },
                      builder: (context, state) {
                        return CommonButton(
                          margin: const EdgeInsets.all(0),
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
                          width: double.infinity,
                          lable: "Generate OTP",
                        );
                      },
                    )
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
