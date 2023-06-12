import '../models/pokemon.dart';
import '../models/resource.dart';
import '../services/APIs/poke_api.dart';

class PokeRepo {
  final PokeApi _pokeApi = PokeApi();

  Future<Resource?> getPokemonList() async {
    try {
      final res = await _pokeApi.getPokemonListApi();
      return Resource.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<Pokemon?> getDetailPokemon(String name) async {
    try {
      final res = await _pokeApi.getDetailPokemonApi(name);
      return Pokemon.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
