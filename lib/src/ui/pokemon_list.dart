import 'package:flutter/material.dart';
import '../blocs/pokemon_bloc.dart';
import '../models/item_model.dart';

class PokemonList extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return PokemonListState();
  }
}

class PokemonListState extends State<PokemonList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.fetchAllPokemon();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Pokemon'),
      ),
      body: StreamBuilder(
        stream: bloc.allPokemon,
        builder: (context, AsyncSnapshot<ItemModel> snapshot){
          return snapshot.hasData 
            ? buildList(snapshot)
            : snapshot.hasError
            ? Text(snapshot.error.toString())
            : Center(child: CircularProgressIndicator(),);
        },
      ),);
  }

  String _capitalize(str) => (str?.isNotEmpty ?? false) ? '${str[0].toUpperCase()}${str.substring(1)}' : str; 

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.results.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            '${index+1} - ${_capitalize(snapshot.data.results[index].name)}',
            style: TextStyle(fontSize: 25.0, color: Colors.greenAccent),
          ));
      },
    );
  } 
}