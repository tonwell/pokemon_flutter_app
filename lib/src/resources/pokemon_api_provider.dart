import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class PokemonApiProvider {
  Client client = Client();
  final _pokemonListUrl = "https://pokeapi.co/api/v2/pokemon/?limit=964";

  Future<ItemModel> fetchPokemonList() async {
    final response =await client.get(_pokemonListUrl);
    if(response.statusCode == 200)
      return ItemModel.fromJson(json.decode(response.body));
    else throw Exception("Falha ao carregar lista Pokemon");
  }
}