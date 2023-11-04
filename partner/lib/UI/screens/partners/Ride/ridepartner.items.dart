import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:partner/UI/widget/partner.vehical.container.dart';
import 'package:partner/UI/widget/rides.tabe.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PartnerRideItems extends StatefulWidget {
  const PartnerRideItems({super.key});

  @override
  State<PartnerRideItems> createState() => _PartnerRideItemsState();
}

class _PartnerRideItemsState extends State<PartnerRideItems>
    with SingleTickerProviderStateMixin {
  int tabindex = 0;
  final List _dummyValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {
        tabindex = _controller.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 20),
          child: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            indicatorWeight: 0.001,
            tabs: [
              Tabes(
                currentIndex: tabindex,
                index: 0,
                lable: 'Two wheeler',
              ),
              Tabes(
                currentIndex: tabindex,
                index: 1,
                lable: 'Four wheeler',
              )
            ],
            onTap: (value) {
              setState(() {
                _controller.animateTo(tabindex = _controller.index);
              });
            },
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          LiquidPullToRefresh(
            height: 50,
            springAnimationDurationInMilliseconds: 500,
            color: const Color.fromRGBO(34, 150, 199, 1),
            borderWidth: 1,
            showChildOpacityTransition: true,
            onRefresh: () async {},
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: _dummyValues
                    .map(
                      (e) => const PartnerVehicalContainer(),
                    )
                    .toList(),
              ),
            ),
          ),
          LiquidPullToRefresh(
            height: 50,
            springAnimationDurationInMilliseconds: 500,
            color: const Color.fromRGBO(34, 150, 199, 1),
            borderWidth: 1,
            showChildOpacityTransition: true,
            onRefresh: () async {},
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: _dummyValues
                    .map(
                      (e) => const PartnerVehicalContainer(),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: 328,
        child: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6, bottom: 15),
          child: OutlineGradientButton(
            onTap: () {
              Navigator.pushNamed(context, "/partner/ride/items/edit");
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
                  colors: const [
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
