import 'package:flutter/material.dart';
import 'package:partner/UI/widget/ownerRequestCard.dart';
import 'package:partner/UI/widget/rides.tabe.dart';

class RidesRequest extends StatefulWidget {
  const RidesRequest({super.key});

  @override
  State<RidesRequest> createState() => _RidesRequestState();
}

class _RidesRequestState extends State<RidesRequest>
    with SingleTickerProviderStateMixin {
  int tabindex = 0;
  List<int> val = [1, 2, 3, 4, 5, 6, 7, 8, 9];
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
        title: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          indicatorWeight: 0.001,
          tabs: [
            Tabes(
              currentIndex: tabindex,
              index: 0,
              lable: 'Rental Requests',
            ),
            Tabes(
              currentIndex: tabindex,
              index: 1,
              lable: 'Ride Requests',
            )
          ],
          onTap: (value) {
            setState(() {
              _controller.animateTo(tabindex = _controller.index);
            });
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          RentalRequest(val: val),
          RentalRequest(val: val),
        ],
      ),
    );
  }
}

class RentalRequest extends StatelessWidget {
  const RentalRequest({
    super.key,
    required this.val,
  });

  final List<int> val;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: val.map((e) => OwnerRequestcard()).toList(),
        ),
      ),
    );
  }
}
