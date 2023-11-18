// import 'package:customer/middleware/helpers/storage.utils.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../constants/localstorage.keys.dart';
// import '../presentation/widgets/buttons/commonbutton.dart';
// import '../presentation/widgets/customformfield.dart';

// class RegistrationEmail extends StatefulWidget {
//   const RegistrationEmail({super.key});

//   @override
//   State<RegistrationEmail> createState() => _RegistrationEmailState();
// }

// class _RegistrationEmailState extends State<RegistrationEmail> {
//   final _formkey = GlobalKey<FormState>();

//   TextEditingController emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(245, 245, 245, 1),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Color.fromRGBO(245, 245, 245, 1),
//         leading: const BackButton(
//           color: Color(0xFF565656),
//         ),
//         centerTitle: true,
//         title: Text(
//           'Guest SignUp',
//           textAlign: TextAlign.center,
//           style: GoogleFonts.lato(
//             color: const Color(0xFF565656),
//             fontSize: 14,
//             fontWeight: FontWeight.w700,
//             letterSpacing: -0.28,
//           ),
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Enter your Email",
//                 style: GoogleFonts.lato(
//                     color: const Color(0xE5555555),
//                     letterSpacing: -0.72,
//                     fontSize: 24,
//                     fontWeight: FontWeight.w600),
//               ),
//               Form(
//                   key: _formkey,
//                   child: Container(
//                     margin: const EdgeInsets.only(top: 16, right: 22, left: 22),
//                     child: Column(
//                       children: [
//                         CustomFormField(
//                           keyBoardtype: TextInputType.emailAddress,
//                           controller: emailController,
//                           hintText: "",
//                           function: (p0) {
//                             if (p0!.isEmpty) {
//                               return "Please enter something";
//                             } else {
//                               return null;
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   )),
//               // Container(
//               //   child: Row(
//               //     mainAxisSize: MainAxisSize.min,
//               //     mainAxisAlignment: MainAxisAlignment.center,
//               //     children: [
//               //       Text(
//               //         'Already Registered?',
//               //         textAlign: TextAlign.center,
//               //         style: GoogleFonts.lato(
//               //           color: const Color(0xB2555555),
//               //           fontSize: 14,
//               //           fontWeight: FontWeight.w600,
//               //         ),
//               //       ),
//               //       TextButton(
//               //         onPressed: () {
//               //           Navigator.pushReplacementNamed(context, '/login');
//               //         },
//               //         child: Text(
//               //           ' Login here',
//               //           textAlign: TextAlign.center,
//               //           style: GoogleFonts.lato(
//               //             color: const Color(0xFF3BA365),
//               //             fontSize: 14,
//               //             fontWeight: FontWeight.w500,
//               //             letterSpacing: -0.42,
//               //           ),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               CommonButton(
//                 borderradius: 4,
//                 height: 48,
//                 width: 328,
//                 lable: 'Continue',
//                 margin: const EdgeInsets.symmetric(vertical: 10),
//                 onPressed: () {
//                   bool readyToProceed = _formkey.currentState!.validate();
//                   if (readyToProceed) {
//                     LocalStorage.write(
//                         key: LocalStorageKeys.email,
//                         value: emailController.text);
//                     Navigator.pushReplacementNamed(context, '/checkin');
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
