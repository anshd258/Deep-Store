import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/util/utilwidget.dart';
import 'package:partner/UI/widget/Buttons/OutlinedDeclineButton.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';
import 'package:partner/UI/widget/editPage.FormField.dart';
import 'package:partner/helpers/models/food.request.dart';

class GuestDetailsForm extends StatefulWidget {
  List<User>? data;
  GuestDetailsForm({super.key, this.data});

  @override
  State<GuestDetailsForm> createState() => _GuestDetailsFormState();
}

class _GuestDetailsFormState extends State<GuestDetailsForm> {
  List<User> data = [
    User(img: null),
  ];
  @override
  void initState() {
    data = widget.data ??
        [
          User(img: null),
        ];

    super.initState();
  }

  bool value = false;

  bool value3 = false;

  _getFromGallery(User e) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        e.img = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = "Edit customer booking";
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: LayoutBuilder(builder: (context, constrains) {
        return SizedBox(
          height: constrains.maxHeight - 130,
          child: Swiper(
              loop: false,
              itemCount: data.length,
              viewportFraction: 0.85,
              scale: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            enableFeedback: true,
                            alignment: Alignment.center,
                            splashRadius: 20,
                            iconSize: 25,
                            padding: EdgeInsets.all(0),
                            constraints: BoxConstraints(
                              minHeight: 30,
                            ),
                            onPressed: () {
                              if (data.length == 1) {
                                errorSnackBar(
                                    context, "room should have atlest 1 guest");
                              } else {
                                setState(() {
                                  data.removeAt(index);
                                });
                              }
                            },
                            icon: Icon(
                              Icons.cancel_rounded,
                              color: Colors.redAccent.shade400,
                            ))),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.30),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "${index + 1} / ${data.length}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.48,
                                ),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 328,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: data[index].img != null
                                      ? DecorationImage(
                                          image: FileImage(data[index].img!),
                                          fit: BoxFit.cover)
                                      : null,
                                  color: const Color.fromRGBO(86, 86, 86, 0.2)),
                              child: data[index].img != null
                                  ? Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        onPressed: () {
                                          _getFromGallery(data[index]);
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
                                            _getFromGallery(data[index]);
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
                              hintText: "Alice lee",
                              maxlength: 200,
                              name: "Customer name *",
                            ),
                            ProfileEditFormField(
                              function: (value) {
                                return null;
                              },
                              keyBoardtype: TextInputType.number,
                              hintText: "+91 992293923",
                              maxlength: 200,
                              name: "Phone number *",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
        );
      }),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedDeclineButton(
              color: const Color.fromRGBO(34, 150, 199, 1),
              function: () {
                setState(() {
                  data.add(User());
                });
              },
              height: 44,
              margin: const EdgeInsets.all(0),
              borderradius: 8,
              lable: "Add another Guest",
              width: 158),
          GradientCommonButton(
              function: () {},
              height: 44,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              borderradius: 8,
              lable: "Save",
              width: 158),
        ],
      ),
    );
  }
}
