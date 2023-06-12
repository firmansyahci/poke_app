import 'package:flutter/material.dart';

class AppColors {
  static IdentityColor identityColor = const IdentityColor();
  static PokemonTypeColor pokemonTypeColor = const PokemonTypeColor();
  static GrayscaleColor grayscaleColor = const GrayscaleColor();
}

class IdentityColor {
  const IdentityColor();

  Color get primary => const Color(0xFFDC0A2D);
}

class PokemonTypeColor {
  const PokemonTypeColor();

  Color get bug => const Color(0xFFA7B723);
  Color get dark => const Color(0xFF75574C);
  Color get dragon => const Color(0xFF7037FF);
  Color get electric => const Color(0xFFF9CF30);
  Color get fairy => const Color(0xFFE69EAC);
  Color get fighting => const Color(0xFFC12239);
  Color get fire => const Color(0xFFF57D31);
  Color get flying => const Color(0xFFA891EC);
  Color get ghost => const Color(0xFF70559B);
  Color get normal => const Color(0xFFAAA67F);
  Color get grass => const Color(0xFF74CB48);
  Color get ground => const Color(0xFFDEC16B);
  Color get ice => const Color(0xFF9AD6DF);
  Color get poison => const Color(0xFFA43E9E);
  Color get psychic => const Color(0xFFFB5584);
  Color get rock => const Color(0xFFB69E31);
  Color get steel => const Color(0xFFB7B9D0);
  Color get water => const Color(0xFF6493EB);
}

class GrayscaleColor {
  const GrayscaleColor();

  Color get dark => const Color(0xFF1D1D1D);
  Color get medium => const Color(0xFF666666);
  Color get light => const Color(0xFFE0E0E0);
  Color get background => const Color(0xFFEFEFEF);
  Color get white => const Color(0xFFFFFFFF);
}
