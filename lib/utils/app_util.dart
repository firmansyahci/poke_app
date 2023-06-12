import 'package:flutter/material.dart';

import '../const/app_colors.dart';
import '../const/pokemon_type.dart';

class AppUtil {
  static String getFormattedNumber(int? id) {
    if (id == null) return '';

    if (id < 10) {
      return '#00$id';
    } else if (id < 100) {
      return '#0$id';
    } else {
      return '#$id';
    }
  }

  static Color getColorByType(String type) {
    switch (type) {
      case PokemonType.bug:
        return AppColors.pokemonTypeColor.bug;
      case PokemonType.dark:
        return AppColors.pokemonTypeColor.dark;
      case PokemonType.dragon:
        return AppColors.pokemonTypeColor.dragon;
      case PokemonType.electric:
        return AppColors.pokemonTypeColor.electric;
      case PokemonType.fairy:
        return AppColors.pokemonTypeColor.fairy;
      case PokemonType.fighting:
        return AppColors.pokemonTypeColor.fighting;
      case PokemonType.fire:
        return AppColors.pokemonTypeColor.fire;
      case PokemonType.flying:
        return AppColors.pokemonTypeColor.flying;
      case PokemonType.ghost:
        return AppColors.pokemonTypeColor.ghost;
      case PokemonType.grass:
        return AppColors.pokemonTypeColor.grass;
      case PokemonType.ground:
        return AppColors.pokemonTypeColor.ground;
      case PokemonType.ice:
        return AppColors.pokemonTypeColor.ice;
      case PokemonType.normal:
        return AppColors.pokemonTypeColor.normal;
      case PokemonType.poison:
        return AppColors.pokemonTypeColor.poison;
      case PokemonType.psychic:
        return AppColors.pokemonTypeColor.psychic;
      case PokemonType.rock:
        return AppColors.pokemonTypeColor.rock;
      case PokemonType.steel:
        return AppColors.pokemonTypeColor.steel;
      case PokemonType.water:
        return AppColors.pokemonTypeColor.water;
      default:
        return AppColors.grayscaleColor.white;
    }
  }
}
