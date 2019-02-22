import 'package:pokemon_app/src/models/item_model.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class PokemonBloc {
  final _repository = Repository();
  final _pokemonFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allPokemon => _pokemonFetcher.stream;

  fetchAllPokemon() async {
    ItemModel itemModel =await _repository.fetchAllPokemon();
    _pokemonFetcher.sink.add(itemModel);
  }

  dispose() {
    _pokemonFetcher.close();
  }
}

final bloc = PokemonBloc();