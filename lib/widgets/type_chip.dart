import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const/app_colors.dart';
import '../const/app_text_style.dart';

class TypeChip extends StatelessWidget {
  final String? name;
  const TypeChip({
    this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, right: 8),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.grayscaleColor.white.withOpacity(0.3),
      ),
      child: Text(
        toBeginningOfSentenceCase(name) ?? '',
        style: AppTextStyles.headerTextStyle.subtitle3.copyWith(
          color: AppColors.grayscaleColor.white,
        ),
      ),
    );
  }
}
