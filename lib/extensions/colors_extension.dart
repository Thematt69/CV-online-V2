import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color adjustOpacity(double opacity) {
    return withAlpha((255.0 * opacity).round());
  }
}
