import 'package:pokemon_app/src/models/item_model.dart';

import 'pokemon_api_provider.dart';

class Repository {
  final pokemonApiProvider = PokemonApiProvider();

  Future<ItemModel> fetchAllPokemon() => pokemonApiProvider.fetchPokemonList();

}