import 'package:flutter/material.dart';

class Editpageimage extends StatelessWidget {
  final String path;
  const Editpageimage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  path,
                  width: MediaQuery.of(context).size.width,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 45,
                  alignment: Alignment.center,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.black.withOpacity(0.30000001192092896),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Icon(Icons.mode_edit_outline_outlined,
                      color: Colors.white, size: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
