import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/commonbutton.dart';
import 'editprofile.form.dart';
import 'editprofile.image.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Color(0xFF565656),
        ),
        centerTitle: true,
        title: Text(
          'Edit Account',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: Color(0xFF565656),
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
              Editpageimage( src: "https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
              Form(
                  key: _formkey,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Column(
                      children: [
                        ProfileEditFormField(
                            keyBoardtype: TextInputType.name,
                            hintText: "Alice lee",
                            maxlength: 20,
                            function: (p0) {
                              if (p0!.isEmpty) {
                                return "Please enter something";
                              } else
                                return null;
                            },
                            icon: Icons.person,
                            name: "Full Name"),
                        ProfileEditFormField(
                            keyBoardtype: TextInputType.phone,
                            maxlength: 10,
                            hintText: "9762065768",
                            function: (p0) {
                              if (p0!.isEmpty) {
                                return "Please enter something";
                              } else if (p0.length != 10) {
                                return "Please enter a valid number";
                              } else
                                return null;
                            },
                            icon: Icons.phone,
                            name: "Phone"),
                        ProfileEditFormField(
                            hintText: 'IDBD900',
                            keyBoardtype: TextInputType.text,
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
              CommonButton(
                borderradius: 4,
                height: 48,
                width: 328,
                lable: 'Save changes',
                margin: EdgeInsets.symmetric(vertical: 10),
                onPressed: () {
                  _formkey.currentState!.validate();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

