import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../const/app_assets.dart';
import '../const/app_colors.dart';
import '../const/app_text_style.dart';
import '../models/pokemon.dart';
import '../utils/app_util.dart';
import '../widgets/about_tile.dart';
import '../widgets/stat_tile.dart';
import '../widgets/type_chip.dart';

class DetailScreen extends StatefulWidget {
  final Pokemon? pokemon;

  const DetailScreen({this.pokemon, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Container(
                height: 300,
                color: AppUtil.getColorByType(
                    widget.pokemon?.types?.first.type?.name ?? ''),
                child: Stack(
                  children: [
                    Positioned(
                      top: 120,
                      right: -25,
                      child: Opacity(
                        opacity: 0.3,
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset(AppAssets.pokeball),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          InkWell(
                            onTap: Get.back,
                            child: Icon(
                              Icons.arrow_back,
                              color: AppColors.grayscaleColor.white,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    toBeginningOfSentenceCase(
                                            widget.pokemon?.name) ??
                                        '',
                                    style: AppTextStyles
                                        .headerTextStyle.headline
                                        .copyWith(
                                            color:
                                                AppColors.grayscaleColor.white),
                                  ),
                                  if (widget.pokemon?.types?.isNotEmpty ??
                                      false)
                                    Row(
                                      children: widget.pokemon!.types!
                                          .map(
                                            (e) => TypeChip(name: e.type?.name),
                                          )
                                          .toList(),
                                    ),
                                ],
                              ),
                              Text(
                                AppUtil.getFormattedNumber(widget.pokemon?.id),
                                style: AppTextStyles.headerTextStyle.subtitle2
                                    .copyWith(
                                  color: AppColors.grayscaleColor.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.grayscaleColor.white,
                  ),
                  child: Column(
                    children: [
                      TabBar(
                        controller: tabController,
                        labelPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 4),
                        tabs: [
                          Text(
                            'About',
                            style: AppTextStyles.headerTextStyle.subtitle1,
                          ),
                          Text(
                            'Base Stats',
                            style: AppTextStyles.headerTextStyle.subtitle1,
                          ),
                          Text(
                            'Evolution',
                            style: AppTextStyles.headerTextStyle.subtitle1,
                          ),
                          Text(
                            'Moves',
                            style: AppTextStyles.headerTextStyle.subtitle1,
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  AboutTile(
                                    title: 'Species',
                                    content: widget.pokemon?.species?.name,
                                  ),
                                  AboutTile(
                                    title: 'Height',
                                    content: '${widget.pokemon?.height} m',
                                  ),
                                  AboutTile(
                                    title: 'Weight',
                                    content: '${widget.pokemon?.weight} kg',
                                  ),
                                  AboutTile(
                                    title: 'Abilities',
                                    content:
                                        '${widget.pokemon?.abilities?.map((e) => toBeginningOfSentenceCase(e.ability?.name)).toList().join(', ')}',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child:
                                  (widget.pokemon?.stats?.isNotEmpty ?? false)
                                      ? Column(
                                          children: widget.pokemon!.stats!
                                              .map((e) => StatTile(
                                                    title: e.stat?.name,
                                                    stat: e.baseStat,
                                                  ))
                                              .toList(),
                                        )
                                      : Container(),
                            ),
                            Container(),
                            Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 130,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.network(
                widget.pokemon?.sprites?.other?.officialArtwork?.frontDefault ??
                    '',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
