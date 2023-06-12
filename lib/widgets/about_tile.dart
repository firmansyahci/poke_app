import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const/app_colors.dart';
import '../const/app_text_style.dart';

class AboutTile extends StatelessWidget {
  final String? title;
  final String? content;

  const AboutTile({this.title, this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title ?? '',
              style: AppTextStyles.bodyTextStyle.body3.copyWith(
                color: AppColors.grayscaleColor.medium,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              toBeginningOfSentenceCase(content) ?? '',
              style: AppTextStyles.bodyTextStyle.body3,
            ),
          )
        ],
      ),
    );
  }
}
