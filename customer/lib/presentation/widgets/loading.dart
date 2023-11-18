import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white60,
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
  }
}