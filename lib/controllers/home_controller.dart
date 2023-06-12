import 'package:get/get.dart';
import 'package:poke_app/screens/detail_screen.dart';

import '../models/pokemon.dart';
import '../models/resource.dart';
import '../repositories/poke_repo.dart';

class HomeController extends GetxController {
  final PokeRepo _pokeRepo = PokeRepo();

  final List<Pokemon> pokemons = <Pokemon>[].obs;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getPokemonList();
  }

  goToDetailPage(Pokemon pokemon) {
    Get.to(
      () => DetailScreen(pokemon: pokemon),
    );
  }

  Future<void> getPokemonList() async {
    pokemons.clear();
    isLoading.value = true;
    update();
    try {
      final Resource? pokemonList = await _pokeRepo.getPokemonList();

      if (pokemonList?.results?.isNotEmpty ?? false) {
        pokemonList?.results?.forEach((e) async {
          final Pokemon? pokemon =
              await _pokeRepo.getDetailPokemon(e.name ?? '');

          if (pokemon != null) {
            pokemons.add(pokemon);
          }
        });
      }
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      update();
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Error',
          message: 'Something went wrong',
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
