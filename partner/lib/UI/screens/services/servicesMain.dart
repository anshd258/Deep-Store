import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:partner/Constants/filterEnum.dart';
import 'package:partner/UI/screens/services/servicesMainBody.dart';
import 'package:partner/middleware/ServicesCubit/services_cubit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ServicesMain extends StatefulWidget {
  const ServicesMain({super.key});

  @override
  State<ServicesMain> createState() => _ServicesMainState();
}

class _ServicesMainState extends State<ServicesMain> {
  Services selected = Services.FOOD;
  @override
  void initState() {
    context.read<ServicesCubit>().onRefresh("route", selected);
    super.initState();
  }

  void changeTab(Services tab) {
    setState(() {
      selected = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 32),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Text(
                      "In-house services",
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: Services.values.map((e) {
                            return Ongoing(
                              e: e,
                              fun: changeTab,
                              selected: selected,
                            );
                          }).toList(),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ServicesBody(
        tab: selected,
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: 328,
        child: Builder(builder: (context) {
          ({String route, String title}) record =
              getTitleAndRoute(); //* used to get title and route as a record
          return Padding(
            padding: const EdgeInsets.only(left: 6, right: 6, bottom: 15),
            child: OutlineGradientButton(
              onTap: () {
                Navigator.pushNamed(context, "/partner/ride/${record.route}");
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
                child: GradientText("+ Add new ${record.title}",
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
          );
        }),
      ),
    );
  }

  ({String route, String title}) getTitleAndRoute() {
    if (selected == Services.FOOD) {
      return (title: "item", route: "items/edit");
    } else if (selected == Services.RENTALS) {
      return (title: "vehical", route: "items/edit");
    } else if (selected == Services.TRANSPORT) {
      return (title: "Transport", route: "items/edit");
    } else if (selected == Services.HOUSEKEEPING) {
      return (title: "housekeeper", route: "items/edit");
    } else {
      return (title: "laundry", route: "items/edit");
    }
  }
}

class Ongoing extends StatefulWidget {
  final Services e;
  final Services selected;
  final Function fun;
  const Ongoing(
      {super.key, required this.e, required this.fun, required this.selected});

  @override
  State<Ongoing> createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> with SingleTickerProviderStateMixin {
  AnimationController? ctr;
  @override
  void initState() {
    ctr = AnimationController(vsync: this, lowerBound: 0, upperBound: 1);
    ctr!.stop();

    super.initState();
  }

  @override
  void dispose() {
    ctr!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            widget.fun(widget.e);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              color: Colors.grey,
              gradient: widget.e == widget.selected
                  ? const LinearGradient(colors: [
                      Color.fromRGBO(32, 171, 154, 1),
                      Color.fromRGBO(34, 150, 199, 1)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                  : const LinearGradient(colors: [
                      Color.fromRGBO(227, 227, 227, 1),
                      Color.fromRGBO(227, 227, 227, 1),
                    ], begin: Alignment.bottomCenter, end: Alignment.topRight),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            constraints: const BoxConstraints(minHeight: 33, minWidth: 60),
            child: Text(
              widget.e.name,
              style: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: widget.e == widget.selected
                      ? Colors.white
                      : Colors.grey.shade700),
            ),
          ),
        ).animate(controller: ctr).scaleXY(
            begin: 1, end: 1.1, duration: const Duration(microseconds: 10));
      },
    );
  }
}
