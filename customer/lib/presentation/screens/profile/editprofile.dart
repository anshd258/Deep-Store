import 'package:customer/data/models/user.dart';
import 'package:customer/middleware/blocs/authentication/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/buttons/commonbutton.dart';
import '../../widgets/customformfield.dart';
import '../../widgets/profileImage.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController roomController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// get users old information.
    ///
    /// update in exiting controllers.
    User? user = context.read<AuthCubit>().state.user;
    if (user != null) {
      phoneController.text = user.contact!;
      nameController.text = user.firstName! + user.lastName!;
      emailController.text = user.email!;
      roomController.text = user.room ?? '';
    }
  }

  bool? loading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
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
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.28,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Expanded(
                  flex: 4, child: Editpageimage(path: 'assets/user.png')),
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: CustomFormField(
                                keyBoardtype: TextInputType.name,
                                controller: nameController,
                                hintText: "",
                                maxlength: 30,
                                function: (p0) {
                                  if (p0!.isEmpty) {
                                    return "Please enter something";
                                  } else {
                                    return null;
                                  }
                                },
                                icon: Icons.person,
                                name: "Username"),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: CustomFormField(
                                    controller: phoneController,
                                    keyBoardtype: TextInputType.phone,
                                    maxlength: 10,
                                    hintText: "",
                                    function: (p0) {
                                      if (p0!.isEmpty) {
                                        return "Please enter something";
                                      } else if (p0.length != 10) {
                                        return "Please enter a valid number";
                                      } else {
                                        return null;
                                      }
                                    },
                                    icon: Icons.phone,
                                    name: "Phone"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 3,
                                child: CustomFormField(
                                    controller: roomController,
                                    hintText: '',
                                    keyBoardtype: TextInputType.number,
                                    maxlength: 6,
                                    icon: Icons.touch_app,
                                    function: (p0) {
                                      if (p0!.isEmpty) {
                                        return "Please enter something";
                                      } else {
                                        return null;
                                      }
                                    },
                                    name: "Room"),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: CustomFormField(
                                controller: emailController,
                                keyBoardtype: TextInputType.emailAddress,
                                maxlength: 50,
                                hintText: "",
                                function: (p0) {
                                  return null;
                                },
                                icon: Icons.phone,
                                name: "Email"),
                          ),
                        ],
                      )),
                ),
              ),
              CommonButton(
                borderradius: 4,
                height: 52,
                width: double.infinity,
                lable: 'Save changes',
                margin: const EdgeInsets.symmetric(vertical: 0),
                onPressed: () {
                  setState(() {
                    loading = true;
                  });
                  bool readyToProceed = _formkey.currentState!.validate();
                  if (readyToProceed) {
                    /// fetch values from controllers.
                    String newName = nameController.text;
                    String newPhone = phoneController.text;
                    String newEmail = emailController.text;
                    String newRoomNo = roomController.text;

                    context
                        .read<AuthCubit>()
                        .updateUserDetails(
                          name: newName,
                          phone: newPhone,
                          providerid: '123456',
                          roomNumber: newRoomNo,
                          email: newEmail,
                        )
                        .then((value) {
                      if (value) {
                        setState(() {
                          loading = false;
                        });
                        Future.delayed(const Duration(seconds: 1)).then((value) {
                          Navigator.pop(context);
                        });
                      } else {
                        print('something went wrong: unable to update user');
                        setState(() {
                          loading = null;
                        });
                      }
                    });
                  }
                },
                child: loading == null
                    ? null
                    : (loading!
                        ? const CircularProgressIndicator()
                        : const Icon(Icons.done)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
