import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:partner/UI/widget/partner.food.container.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PartnerFoodEditPage extends StatefulWidget {
  const PartnerFoodEditPage({super.key});

  @override
  State<PartnerFoodEditPage> createState() => _PartnerFoodEditPageState();
}

class _PartnerFoodEditPageState extends State<PartnerFoodEditPage> {
  List dummyValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    String title = "Ladakh tea stall";
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color.fromRGBO(86, 86, 86, 1),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(title,
            style: GoogleFonts.lato(
                color: Color.fromRGBO(86, 86, 86, 1),
                fontSize: 17,
                fontWeight: FontWeight.w600)),
      ),
      backgroundColor: Colors.white,
      body: LiquidPullToRefresh(
        height: 50,
        springAnimationDurationInMilliseconds: 500,
        color: Color.fromRGBO(34, 150, 199, 1),
        borderWidth: 1,
        showChildOpacityTransition: true,
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: dummyValues
                .map((e) => InkWell(
                      child: PartnerFoodContainer(),
                      onTap: () {
                        Navigator.pushNamed(context, "/partner/food/edit");
                      },
                    ))
                .toList(),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: 328,
        child: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6, bottom: 15),
          child: OutlineGradientButton(
            onTap: () {
              Navigator.pushNamed(context, "/partner/food/additem");
            },
            inkWell: true,
            radius: const Radius.circular(8),
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(32, 171, 154, 1),
              Color.fromRGBO(34, 150, 199, 1)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            strokeWidth: 2,
            backgroundColor: Colors.transparent,
            child: Center(
              child: GradientText("+ Add new item",
                  colors: [
                    Color.fromRGBO(32, 171, 154, 1),
                    Color.fromRGBO(34, 150, 199, 1)
                  ],
                  gradientDirection: GradientDirection.ltr,
                  gradientType: GradientType.linear,
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      ),
    );
  }
}
