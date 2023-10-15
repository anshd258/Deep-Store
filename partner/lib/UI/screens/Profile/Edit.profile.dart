import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/util/utilwidget.dart';
import 'package:partner/UI/widget/editPage.FormField.dart';
import 'package:partner/UI/widget/editpage.image.dart';
import 'package:partner/UI/widget/graedient.common.button.dart';
import 'package:partner/middleware/auth_cubit.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _roomNumber = TextEditingController();
  TextEditingController _email = TextEditingController();

  TextEditingController _contact = TextEditingController();
  TextEditingController _providerId = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Color(0xFF565656),
        ),
        centerTitle: true,
        title: Text(
          'Edit Account',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: const Color(0xFF565656),
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.28,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Editpageimage(
                  src:
                      "https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
              Form(
                  key: _formkey,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(
                      children: [
                        ProfileEditFormField(
                            keyBoardtype: TextInputType.name,
                            ctr: _name,
                            hintText: "Alice lee",
                            maxlength: 20,
                            function: (p0) {
                              if (p0!.isEmpty) {
                                return "Please enter something";
                              } else {
                                return null;
                              }
                            },
                            icon: Icons.person,
                            name: "Full Name"),
                        ProfileEditFormField(
                            keyBoardtype: TextInputType.name,
                            ctr: _contact,
                            hintText: "9911004536",
                            maxlength: 20,
                            function: (p0) {
                              if (p0!.isEmpty) {
                                return "Please enter something";
                              } else {
                                return null;
                              }
                            },
                            icon: Icons.phone_android,
                            name: "Phone Number"),
                        ProfileEditFormField(
                            keyBoardtype: TextInputType.number,
                            ctr: _roomNumber,
                            maxlength: 20,
                            hintText: "201",
                            function: (p0) {
                              if (p0!.isEmpty) {
                                return "Please enter something";
                              } else {
                                return null;
                              }
                            },
                            icon: Icons.meeting_room_outlined,
                            name: "Room No"),
                        ProfileEditFormField(
                            keyBoardtype: TextInputType.emailAddress,
                            ctr: _email,
                            maxlength: 20,
                            hintText: "alice@gmail.com",
                            function: (p0) {
                              if (p0!.isEmpty) {
                                return "Please enter something";
                              } else {
                                return null;
                              }
                            },
                            icon: Icons.email,
                            name: "Email"),
                        ProfileEditFormField(
                            hintText: '858567',
                            keyBoardtype: TextInputType.number,
                            ctr: _providerId,
                            maxlength: 6,
                            icon: Icons.touch_app,
                            function: (p0) {
                              if (p0!.isEmpty) {
                                return "Please enter something";
                              } else if (p0.length != 6) {
                                return "Please enter a ID";
                              } else
                                return null;
                            },
                            name: "Hotel ID"),
                      ],
                    ),
                  )),
              GradientCommonButton(
                borderradius: 4,
                height: 48,
                width: 328,
                lable: 'Save changes',
                margin: const EdgeInsets.symmetric(vertical: 10),
                function: () {
                  _formkey.currentState!.validate();
                  context
                      .read<AuthCubit>()
                      .updateUserDetails(
                          roomNumber: _roomNumber.text,
                          providerid: _providerId.text,
                          name: _name.text,
                          phone: _contact.text,
                          email: _email.text)
                      .then((value) {
                    if (value == true) {
                      Navigator.pop(context);
                    } else {
                      errorSnackBar(context, "some error occured");
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
