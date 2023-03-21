// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String labels;
  final TextEditingController? controller;
  const InputWidget({super.key, required this.labels, this.controller});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: widget.labels,
        isDense: true
      ),
      controller: widget.controller,
    );
  }
}
