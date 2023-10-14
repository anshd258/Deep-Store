import 'package:flutter/material.dart';

class Editpageimage extends StatelessWidget {
  String src;
   Editpageimage({
    super.key,required this.src
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 244,
      width: 328,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
             src ,
              width: 328,
              height: 244,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 288,
            top: 10,
            child: Container(
              width: 32,
              alignment: Alignment.center,
              height: 28,
              decoration: ShapeDecoration(
                color: Colors.black.withOpacity(0.30000001192092896),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              child: const Icon(Icons.mode_edit_outline_outlined,
                  color: Colors.white, size: 20),
            ),
          )
        ],
      ),
    );
  }
}
