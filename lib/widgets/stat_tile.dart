import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const/app_colors.dart';
import '../const/app_text_style.dart';

class StatTile extends StatelessWidget {
  final String? title;
  final int? stat;
  const StatTile({this.title, this.stat, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              toBeginningOfSentenceCase(title) ?? '',
              style: AppTextStyles.bodyTextStyle.body3.copyWith(
                color: AppColors.grayscaleColor.medium,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Text(
                  stat.toString(),
                  style: AppTextStyles.headerTextStyle.subtitle3,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 4,
                    width: double.infinity,
                    color: AppColors.grayscaleColor.medium,
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: stat! / 100,
                      child: Container(
                        height: 4,
                        width: double.infinity,
                        color: stat! < 50
                            ? AppColors.pokemonTypeColor.fire
                            : AppColors.pokemonTypeColor.grass,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
