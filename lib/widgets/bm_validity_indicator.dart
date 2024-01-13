import 'package:flutter/material.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:sizer/sizer.dart';

class BusMeValidityIndicator extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final IconData icon;
  final Color fillColor;
  final BoxBorder border;

  BusMeValidityIndicator({
    required this.text,
    required this.textStyle,
    required this.icon,
    required this.fillColor,
    required this.border});

  @override
  State<BusMeValidityIndicator> createState() => _BusMeValidityIndicatorState();
}

class _BusMeValidityIndicatorState extends State<BusMeValidityIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: 15.sp,
          height: 15.sp,
          decoration: BoxDecoration(
              color: widget.fillColor,
              border: widget.border,
              borderRadius: BorderRadius.circular(50.sp)
          ),
          child: Center(child: Transform.scale(
            scale: 0.9.sp, // Ajusta el factor de escala según tus preferencias
            child: Icon(widget.icon, color: Colors.white, size: 10.sp),
          ),),
        ),
        SizedBox(width: 7.sp,),
        Text(
          widget.text,
          style: widget.textStyle,
        )
      ],
    );
  }
}
