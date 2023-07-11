// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dotted_border/dotted_border.dart';

class DottedBorderWidget extends StatefulWidget {
  const DottedBorderWidget({
    Key? key,
    this.width,
    this.height,
    required this.strokeWidth,
    this.color,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double strokeWidth;
  final Color? color;

  @override
  _DottedBorderWidgetState createState() => _DottedBorderWidgetState();
}

class _DottedBorderWidgetState extends State<DottedBorderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: DottedBorder(
        color: widget.color ?? Colors.black,
        strokeWidth: widget.strokeWidth,
        child: FlutterLogo(size: 148),
      ),
    );
  }
}
