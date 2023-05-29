import 'package:flutter/material.dart';
import 'package:my_app/theme/colors.dart';

@immutable
class AppTheme {
  static const colors = AppColors();

  const AppTheme._();

  static ThemeData define() {
    return ThemeData(
      fontFamily: "",
      primaryColor: colors.white,
    );
  }
}
