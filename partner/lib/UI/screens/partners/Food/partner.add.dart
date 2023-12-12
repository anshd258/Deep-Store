import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/widget/editPage.FormField.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';

class PartnerAddPage extends StatefulWidget {
  const PartnerAddPage({super.key});

  @override
  State<PartnerAddPage> createState() => _PartnerAddPageState();
}

class _PartnerAddPageState extends State<PartnerAddPage> {
  bool value = false;

  bool value3 = false;

  File? file;

  _getFromGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        file = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = "Add Food Partner";
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color.fromRGBO(86, 86, 86, 1),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(title,
            style: GoogleFonts.lato(
                color: const Color.fromRGBO(86, 86, 86, 1),
                fontSize: 17,
                fontWeight: FontWeight.w600)),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.30),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 328,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: file != null
                          ? DecorationImage(
                              image: FileImage(file!), fit: BoxFit.cover)
                          : null,
                      color: const Color.fromRGBO(86, 86, 86, 0.2)),
                  child: file != null
                      ? Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              _getFromGallery();
                            },
                            splashColor: Colors.white,
                            iconSize: 18,
                            alignment: Alignment.topRight,
                            icon: const Icon(
                              Icons.mode_edit_outline_outlined,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Center(
                          child: GradientCommonButton(
                              function: () {
                                _getFromGallery();
                              },
                              height: 36,
                              margin: const EdgeInsets.all(0),
                              borderradius: 100,
                              lable: "+ Add Image",
                              width: 111)),
                ),
                const SizedBox(
                  height: 7,
                ),
                ProfileEditFormField(
                  function: (value) {
                    return null;
                  },
                  keyBoardtype: TextInputType.name,
                  hintText: "Chicken Tandoori",
                  maxlength: 200,
                  name: "Name",
                ),
                ProfileEditFormField(
                  function: (value) {
                    return null;
                  },
                  keyBoardtype: TextInputType.number,
                  hintText: "+91 9911007788",
                  maxlength: 200,
                  name: "Phone Number",
                ),
                ProfileEditFormField(
                  function: (value) {
                    return null;
                  },
                  keyBoardtype: TextInputType.number,
                  hintText: "12 %",
                  maxlength: 10,
                  name: "Commission",
                ),
                SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Select Food Type*",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF555555),
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.48,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              Checkbox.adaptive(
                                checkColor: Colors.green,
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors.transparent.withOpacity(.32);
                                  }
                                  return Colors.transparent;
                                }),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                value: value,
                                onChanged: (val) {
                                  setState(() {
                                    value = val ?? true;
                                  });
                                },
                              ),
                              const Text(
                                "Veg",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.48,
                                ),
                              ),
                              const Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.crop_square_sharp,
                                    color: Colors.green,
                                    size: 36,
                                  ),
                                  Icon(Icons.circle,
                                      color: Colors.green, size: 14),
                                ],
                              ),
                              Checkbox.adaptive(
                                checkColor: Colors.red,
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors.transparent.withOpacity(.32);
                                  }
                                  return Colors.transparent;
                                }),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                value: value3,
                                onChanged: (val) {
                                  setState(() {
                                    value3 = val ?? true;
                                  });
                                },
                              ),
                              const Text(
                                "Non-veg",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.48,
                                ),
                              ),
                              const Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.crop_square_sharp,
                                    color: Colors.red,
                                    size: 36,
                                  ),
                                  Icon(Icons.circle,
                                      color: Colors.red, size: 14),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GradientCommonButton(
          function: () {},
          height: 44,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          borderradius: 8,
          lable: "Save",
          width: 328),
    );
  }
}
