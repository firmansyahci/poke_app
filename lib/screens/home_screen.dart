import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/app_assets.dart';
import '../const/app_colors.dart';
import '../const/app_text_style.dart';
import '../controllers/home_controller.dart';
import '../models/pokemon.dart';
import '../widgets/pokemon_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscaleColor.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: AppColors.identityColor.primary,
              child: Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      AppAssets.pokeball,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Pokédex',
                    style: AppTextStyles.headerTextStyle.headline.copyWith(
                      color: AppColors.grayscaleColor.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => _homeController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : RefreshIndicator(
                        onRefresh: _homeController.getPokemonList,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              crossAxisCount: 2,
                              childAspectRatio: 5 / 3,
                            ),
                            padding: const EdgeInsets.all(20),
                            itemCount: _homeController.pokemons.length,
                            itemBuilder: (ctx, i) {
                              final Pokemon pokemon =
                                  _homeController.pokemons[i];
                              return InkWell(
                                onTap: () =>
                                    _homeController.goToDetailPage(pokemon),
                                child: PokemonCard(
                                  id: pokemon.id,
                                  name: pokemon.name,
                                  img: pokemon.sprites?.other?.officialArtwork
                                      ?.frontDefault,
                                  type: pokemon.types,
                                ),
                              );
                            }),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
