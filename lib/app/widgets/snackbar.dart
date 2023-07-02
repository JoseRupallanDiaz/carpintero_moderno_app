import 'package:el_carpintero_moderno_app/app/styles/app_theme.dart';
import 'package:flutter/material.dart';

SnackBar appSnackBar(String label) {
  return SnackBar(
    content: Text(label),
    backgroundColor: AppTheme.buttonHighlight,
    behavior: SnackBarBehavior.floating,
  );
}
