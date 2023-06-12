import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const/app_colors.dart';
import '../const/app_text_style.dart';
import '../models/pokemon.dart';
import '../utils/app_util.dart';
import 'type_chip.dart';

class PokemonCard extends StatelessWidget {
  final int? id;
  final String? name;
  final String? img;
  final List<Type>? type;

  const PokemonCard({this.id, this.name, this.img, this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppUtil.getColorByType(type?.first.type?.name ?? '')
            .withOpacity(0.75),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    toBeginningOfSentenceCase(name) ?? '',
                    style: AppTextStyles.headerTextStyle.subtitle1
                        .copyWith(color: AppColors.grayscaleColor.white),
                  ),
                  Text(
                    AppUtil.getFormattedNumber(id),
                    style: AppTextStyles.bodyTextStyle.body3.copyWith(
                      color: AppColors.grayscaleColor.medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (type?.isNotEmpty ?? false)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: type!
                      .map(
                        (e) => TypeChip(name: e.type?.name),
                      )
                      .toList(),
                ),
            ],
          ),
          Positioned(
            bottom: 1,
            right: 1,
            child: SizedBox(
              height: 72,
              width: 72,
              child: Image.network(
                img ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
