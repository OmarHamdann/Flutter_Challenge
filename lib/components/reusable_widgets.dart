import 'package:flutter/material.dart';

Widget defaultButton({
  required VoidCallback onPressed,
  required Widget child,
  Color color=Colors.teal,
}) =>
    MaterialButton(
      onPressed: onPressed,
      child: child,
      color: color,
    );
