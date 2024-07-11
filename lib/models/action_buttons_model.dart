import 'package:flutter/material.dart';

class ActionButtonModel {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;
  final BorderSide? side;

  ActionButtonModel({
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPressed,
    this.side,
  });
}
