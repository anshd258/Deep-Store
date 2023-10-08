
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

/// A basic container with squicircle with glass effect.. highly customizeable.
class SquicircleContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final BoxBorder? border;
  final double? width;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color? color;
  final Gradient? gradient;
  final double cornerRadius;

  const SquicircleContainer(
      {super.key,
      this.height,
      this.border,
      this.width,
      this.padding = const EdgeInsets.all(0),
      this.margin = const EdgeInsets.all(0),
      this.color = Colors.transparent,
      this.cornerRadius = 8,
      this.child,
      this.gradient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ClipSmoothRect(
        radius: SmoothBorderRadius(
          cornerRadius: cornerRadius,
          cornerSmoothing: 1,
        ),
        child: SizedBox(
            width: width,
            height: height,
            child:Container(
                    padding: padding,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(cornerRadius)),
                        color: color,
                        gradient: gradient,
                        border: border),
                    child: child,
                  )),
      )
    );
  }
}
