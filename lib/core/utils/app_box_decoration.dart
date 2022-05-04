import 'package:flutter/material.dart';

class AppBoxDecoration {
  static final commonDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 12,
        )
      ]);
}
