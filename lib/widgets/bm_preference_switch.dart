import 'package:flutter/material.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:sizer/sizer.dart';

class BusMePreferenceSwitch extends StatefulWidget {
  final String label, description;
  final bool value;
  final ValueChanged<bool> onChanged;

  BusMePreferenceSwitch({
    required this.label,
    required this.description,
    required this.value,
    required this.onChanged});

  @override
  State<BusMePreferenceSwitch> createState() => _BusMePreferenceSwitchState();
}

class _BusMePreferenceSwitchState extends State<BusMePreferenceSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: AppTextStyles.boldContentText(context),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Text(
                widget.description,
                style: AppTextStyles.contentText(context),
                softWrap: true,
              ),
            ],
          ),
        ),
        SizedBox(width: 17.sp,),
        Switch(
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Color(0xFFC7C7CC),
          activeTrackColor: Color(0xFF12B28C),
          value: widget.value,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
