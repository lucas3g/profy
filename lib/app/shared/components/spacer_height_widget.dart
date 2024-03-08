import 'package:flutter/material.dart';

import '../domain/entities/app_theme_constants.dart';

class SpacerHeight extends StatelessWidget {
  const SpacerHeight({super.key, this.multiply = 1});

  final int multiply;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppThemeConstants.padding * multiply,
    );
  }
}
