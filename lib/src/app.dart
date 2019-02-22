import 'package:flutter/material.dart';
import 'ui/pokemon_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:Scaffold(
        body: PokemonList(),
      ),
    );
  }
}
