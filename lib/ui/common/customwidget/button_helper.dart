// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:unievents/ui/common/app_colors.dart';

class button_helper extends StatelessWidget {
  button_helper({
    super.key,
    required this.onpress,
    this.color,
    this.margin = const EdgeInsetsDirectional.symmetric(horizontal: 8),
    this.width,
    required this.child,
  });
  Function onpress;
  final Color? color;
  EdgeInsetsDirectional margin;
  double? width;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 2,
              spreadRadius: 1,
              color: getColorWithOpacity(Theme.of(context).primaryColor, 0.2))
        ],
      ),
      child: FilledButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () => onpress(),
        child: child,
      ),
    );
  }
}
