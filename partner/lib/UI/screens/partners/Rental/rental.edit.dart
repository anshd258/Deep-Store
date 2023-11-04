import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';
import 'package:partner/UI/widget/editPage.FormField.dart';

class RentalEditPage extends StatefulWidget {
  const RentalEditPage({super.key});

  @override
  State<RentalEditPage> createState() => _RentalEditPageState();
}

class _RentalEditPageState extends State<RentalEditPage> {
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
    String title = "Edit Ride Partner";
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                hintText: "Driver's name",
                maxlength: 50,
                name: "Name*",
              ),
              ProfileEditFormField(
                function: (value) {
                  return null;
                },
                keyBoardtype: TextInputType.number,
                hintText: "+91 9985467145",
                maxlength: 10,
                name: "Number*",
              ),
              ProfileEditFormField(
                function: (value) {
                  return null;
                },
                keyBoardtype: TextInputType.streetAddress,
                hintText: "license number",
                maxlength: 50,
                name: "Driving license number *",
              ),
              ProfileEditFormField(
                function: (value) {
                  return null;
                },
                keyBoardtype: TextInputType.text,
                hintText: "Vehicle number",
                maxlength: 50,
                name: "Vehicle number *",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GradientCommonButton(
          function: () {
            Navigator.pop(context);
          },
          height: 44,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          borderradius: 8,
          lable: "Save",
          width: 328),
    );
  }
}
