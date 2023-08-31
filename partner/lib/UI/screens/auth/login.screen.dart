import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/widget/graedient.common.button.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController _text = TextEditingController();
  bool _validate = false;
  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Guest Login",
          style: GoogleFonts.lato(
            color: Color(0xB2555555),
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.28,
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 29,
                      child: Text(
                        "Enter your Phone number",
                        style: GoogleFonts.lato(
                            color: Color(0xE5555555),
                            letterSpacing: -0.72,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Text(
                        "Enter your Phone number",
                        style: GoogleFonts.lato(
                          color: Color(0xB2555555),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.28,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 328),
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
                    errorText: _validate ? "please enter 10 numbers" : null,
                    prefixText: "+91",
                    prefixStyle: GoogleFonts.nunito(
                      color: Color(0x99565656),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.25,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 0.50,
                        color: Color(0x33565656),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Not a guest?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Color(0xB2555555),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      ' Login as stay owner',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Color(0xFF3BA365),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.42,
                      ),
                    ),
                  ],
                ),
              ),
              GradientCommonButton(
                function: () {
                  setState(() {
                    if (_text.text.isEmpty || _text.text.length != 10) {
                      print(_text.text.length);
                      _validate = true;
                    } else {
                      _validate = false;
                    }
                  });
                  if (!_validate) {
                    Navigator.of(context).pushReplacementNamed("/otpPage");
                  }
                },
                borderradius: 4,
                height: 48,
                margin: EdgeInsets.symmetric(vertical: 18),
                width: 300,
                lable: "Generate OTP",
              )
            ],
          ),
        ),
      ),
    );
  }
}
