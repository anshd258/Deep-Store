import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../../widgets/buttons/commonbutton.dart';
import 'editprofile.form.dart';
import 'editprofile.image.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formkey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController roomController;

  @override
  void initState() {
    super.initState();

    /// get users old information.
    ///
    /// update in exiting controllers.
    nameController = TextEditingController(text: 'Hemant Thanna');
    phoneController = TextEditingController(text: '9340765396');
    emailController = TextEditingController(text: 'Hemantthanna10@gmail.com');
    roomController = TextEditingController(text: '201');
  }

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
                            controller: nameController,
                            hintText: "",
                            maxlength: 30,
                            function: (p0) {
                              if (p0!.isEmpty) {
                                return "Please enter something";
                              } else
                                return null;
                            },
                            icon: Icons.person,
                            name: "Name"),
                        ProfileEditFormField(
                            controller: phoneController,
                            keyBoardtype: TextInputType.phone,
                            maxlength: 10,
                            hintText: "",
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
                            controller: emailController,
                            keyBoardtype: TextInputType.emailAddress,
                            maxlength: 50,
                            hintText: "",
                            function: (p0) {
                              // if (p0!.isEmpty) {
                              //   return "Please enter something";
                              // } else if (p0.length == 0) {
                              //   return "Please enter a valid number";
                              // } else
                              //   return null;
                            },
                            icon: Icons.phone,
                            name: "Email"),
                        ProfileEditFormField(
                            controller: roomController,
                            hintText: '',
                            keyBoardtype: TextInputType.number,
                            maxlength: 6,
                            icon: Icons.touch_app,
                            function: (p0) {
                              if (p0!.isEmpty) {
                                return "Please enter something";
                              } else
                                return null;
                            },
                            name: "Room Number"),
                      ],
                    ),
                  )),
              CommonButton(
                borderradius: 4,
                height: 48,
                width: 328,
                lable: 'Save changes',
                margin: const EdgeInsets.symmetric(vertical: 10),
                onPressed: () {
                  bool readyToProceed = _formkey.currentState!.validate();
                  if (readyToProceed) {
                    /// fetch values from controllers.
                    String newName = nameController.text;
                    String newPhone = phoneController.text;
                    String newEmail = emailController.text;
                    String newRoomNo = roomController.text;

                    print(newName);
                    print(newPhone);
                    print(newEmail);
                    print(newRoomNo);


                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
