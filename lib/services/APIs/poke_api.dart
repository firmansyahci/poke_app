import '../../const/api_path.dart';
import '../dio_client.dart';

class PokeApi {
  final DioClient _dioClient = DioClient();

  Future<dynamic> getPokemonListApi() async {
    try {
      final res = await _dioClient.get(
        path: ApiPath.pokemon,
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getDetailPokemonApi(String name) async {
    try {
      final res = await _dioClient.get(path: '${ApiPath.pokemon}/$name');
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
